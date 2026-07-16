part of '../phase_progress_screen.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Full-screen image preview
// ─────────────────────────────────────────────────────────────────────────────
class _FullScreenImagePreview extends StatefulWidget {
  const _FullScreenImagePreview({
    required this.images,
    required this.initialIndex,
  });

  final List<File> images;
  final int initialIndex;

  @override
  State<_FullScreenImagePreview> createState() =>
      _FullScreenImagePreviewState();
}

class _FullScreenImagePreviewState extends State<_FullScreenImagePreview> {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          '${_currentIndex + 1} / ${widget.images.length}',
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemBuilder: (context, index) {
          return InteractiveViewer(
            minScale: 0.8,
            maxScale: 4.0,
            child: Center(
              child: Image.file(
                widget.images[index],
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
      // Dot indicators
      bottomNavigationBar: widget.images.length > 1
          ? SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
                  (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: i == _currentIndex ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: i == _currentIndex
                      ? AppColors.primaryLightColor
                      : Colors.white38,
                ),
              ),
            ),
          ),
        ),
      )
          : null,
    );
  }
}