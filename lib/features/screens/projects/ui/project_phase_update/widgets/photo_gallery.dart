part of '../project_phase_update_screen.dart';

/// Horizontal scrollable photo gallery for a progress update entry.
class _PhotoGallery extends StatelessWidget {
  const _PhotoGallery({required this.photos});

  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: AppPadding.p14,
          right: AppPadding.p14,
        ),
        itemCount: photos.length,
        separatorBuilder: (_, __) => AppPadding.p8.horizontalSpace,
        itemBuilder: (context, index) {
          final url = photos[index];
          return _PhotoThumbnail(
            url: url,
            onTap: () => _openFullScreen(context, index),
          );
        },
      ),
    );
  }

  void _openFullScreen(BuildContext context, int initialIndex) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black87,
        pageBuilder: (context, animation, secondaryAnimation) =>
            _FullScreenGallery(
          photos: photos,
          initialIndex: initialIndex,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────

class _PhotoThumbnail extends StatelessWidget {
  const _PhotoThumbnail({required this.url, required this.onTap});

  final String url;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: url,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.s8),
          child: Image.network(
            url,
            width: 100,
            height: 110,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 100,
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.lightBorder,
                borderRadius: BorderRadius.circular(AppSizes.s8),
              ),
              child: const Icon(
                Icons.broken_image_rounded,
                color: AppColors.lightTextSecondary,
                size: 32,
              ),
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 100,
                height: 110,
                decoration: BoxDecoration(
                  color: AppColors.lightBorder.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    strokeWidth: 2,
                    color: AppColors.primaryLightColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────

class _FullScreenGallery extends StatefulWidget {
  const _FullScreenGallery({
    required this.photos,
    required this.initialIndex,
  });

  final List<String> photos;
  final int initialIndex;

  @override
  State<_FullScreenGallery> createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<_FullScreenGallery> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // ── Page view ──────────────────────────────────────────
          PageView.builder(
            controller: _pageController,
            itemCount: widget.photos.length,
            onPageChanged: (index) =>
                setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final url = widget.photos[index];
              return InteractiveViewer(
                child: Center(
                  child: Hero(
                    tag: index == widget.initialIndex ? url : '$url-$index',
                    child: Image.network(
                      url,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.broken_image_rounded,
                        color: Colors.white54,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // ── Close button ───────────────────────────────────────
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 12,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),

          // ── Page indicator ─────────────────────────────────────
          if (widget.photos.length > 1)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.photos.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: index == _currentIndex ? 18 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: index == _currentIndex
                          ? AppColors.primaryLightColor
                          : Colors.white38,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
