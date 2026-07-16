part of '../phase_progress_screen.dart';

class _ThumbnailItem extends StatelessWidget {
  const _ThumbnailItem({
    required this.file,
    required this.onTap,
    required this.onRemove,
  });

  final File file;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: .topRight,
        children: [
          // Image thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.s8),
            child: Image.file(
              file,
              width: AppSizes.s80,
              height: AppSizes.s80,
              fit: BoxFit.cover,
            ),
          ),
          // Remove ×
          GestureDetector(
            onTap: onRemove,
            child: ClipRRect(
              borderRadius:  .only(topRight: .circular(AppSizes.s8)),
              child: Container(
                width: AppSizes.s20,
                height: AppSizes.s20,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}