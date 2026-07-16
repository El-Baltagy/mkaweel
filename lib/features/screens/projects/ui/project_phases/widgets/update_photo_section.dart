part of '../phase_progress_screen.dart';

const int _kMaxPhotos = 5;

class _UploadPhotosSection extends StatefulWidget {
  const _UploadPhotosSection(this.imagesListNotifier);

  final ValueNotifier<List<File>> imagesListNotifier;

  @override
  State<_UploadPhotosSection> createState() => _UploadPhotosSectionState();
}

class _UploadPhotosSectionState extends State<_UploadPhotosSection> {
  // ── Build ─────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.imagesListNotifier,
      builder: (context, _images, child) {
        bool _canAddMore() => _images.length < _kMaxPhotos;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Section title ─────────────────────────────────────────────────
            Row(
              children: [
                Text(
                  'upload_progress_photos'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.primaryLightColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                // Counter badge
                if (_images.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(AppSizes.s12),
                      border: Border.all(
                        color: AppColors.primaryLightColor.withOpacity(0.4),
                      ),
                    ),
                    child: Text(
                      '${_images.length}/$_kMaxPhotos',
                      style: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.primaryLightColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            AppPadding.p8.verticalSpace,

            // ── Picker trigger ────────────────────────────────────────────────
            Container(
              decoration: BoxDecoration(color: AppColors.lightSurface),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  GestureDetector(
                    onTap: () => _showPicker(_canAddMore(),_images),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16,
                        vertical: AppPadding.p14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.s8),
                        border: Border.all(
                          color: _canAddMore()
                              ? AppColors.lightBorder
                              : AppColors.lightBorder.withOpacity(0.4),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12,
                              vertical: AppPadding.p8,
                            ),
                            decoration: BoxDecoration(
                              color: _canAddMore()
                                  ? AppColors.lightBorder
                                  : AppColors.lightBorder.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(AppSizes.s4),
                            ),
                            child: Text(
                              'choose_files'.tr(),
                              style: AppTextStyles.font12Regular.copyWith(
                                color: _canAddMore()
                                    ? AppColors.lightTextPrimary
                                    : AppColors.lightTextPrimary.withOpacity(
                                        0.4,
                                      ),
                              ),
                            ),
                          ),
                          AppPadding.p12.horizontalSpace,
                          Text(
                            _images.isEmpty
                                ? 'no_file_chosen'.tr()
                                : '${_images.length} ${'files_selected'.tr()}',
                            style: AppTextStyles.font12Regular.copyWith(
                              color: _images.isEmpty
                                  ? null
                                  : AppColors.primaryLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppPadding.p4.verticalSpace,

                  if (_images.isEmpty)
                    buildPadding()
                  else
                    buildImagesList(_images),

                  AppPadding.p4.verticalSpace,
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Container buildImagesList(List<File> _images) {
    return Container(
                    margin: .symmetric(
                      vertical: AppPadding.p8,
                      horizontal: AppPadding.p8,
                    ),
                    height: AppSizes.s80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _images.length,
                      separatorBuilder: (_, __) =>
                          AppPadding.p8.horizontalSpace,
                      itemBuilder: (context, index) => _ThumbnailItem(
                        file: _images[index],
                        onTap: () => _openPreview(index, _images),
                        onRemove: () => _remove(index),
                      ),
                    ),
                  );
  }

  Padding buildPadding() {
    return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16,
                    ),
                    child: Text(
                      'photos_hint'.tr(),
                      style: AppTextStyles.font12Regular,
                    ),
                  );
  }



  // ── Remove ────────────────────────────────────────────────────────────────
  void _remove(int index) =>
      widget.imagesListNotifier.value = List.of(widget.imagesListNotifier.value)
        ..removeAt(index);

  // ── Full-screen preview ───────────────────────────────────────────────────
  void _openPreview(int initialIndex, List<File> images) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _FullScreenImagePreview(
          images: List.unmodifiable(images),
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  // ── Pick ──────────────────────────────────────────────────────────────────
  void _showPicker(bool canAddMore,List<File> _images) {
    if (!canAddMore) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('max_photos_reached'.tr(args: ['$_kMaxPhotos'])),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    DialougeChooseImage(
      chooseCameraData: ('from_camera'.tr(), () => _pick(ImageSource.camera,_images)),
      chooseGalleryData: (
        'from_gallery'.tr(),
        () => _pick(ImageSource.gallery,_images),
      ),
    ).toShowDialougePick(context);
  }
  Future<void> _pick(ImageSource source,List<File>  images) async {
    final file = await ImagePickerInfo.pickImage(source, cropped: false);
    if (file != null &&
        mounted &&
         images.map((e) => e.path).toList().contains(file.path)==false
     ) {
      widget.imagesListNotifier.value = List.of(widget.imagesListNotifier.value)
        ..add(file);
    }
  }
}
