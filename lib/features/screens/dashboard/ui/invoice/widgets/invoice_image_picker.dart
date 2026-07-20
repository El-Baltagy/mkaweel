import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/methods/image_picker.dart';
import 'package:mkaweel/core/shared/widgets/dialouge_choose_image.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';

class InvoiceImagePicker extends StatelessWidget {
  const InvoiceImagePicker({
    super.key,
    required this.imageNotifier,
  });

  final ValueNotifier<String> imageNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'attachment'.tr(),
          style: AppTextStyles.font14Regular.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSizes.s8),
        ValueListenableBuilder(
          valueListenable: imageNotifier,
          builder: (context, value, child) {
            final hasImage = value.isNotEmpty;
            return GestureDetector(
              onTap: () => DialougeChooseImage(
                chooseCameraData: ('from_camera'.tr(), () => _pickImage(ImageSource.camera)),
                chooseGalleryData: ('from_gallery'.tr(), () => _pickImage(ImageSource.gallery)),
              ).toShowDialougePick(context),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                  border: Border.all(
                    color: AppColors.lightBorder,
                  ),
                ),
                child: hasImage
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.s8),
                        child: value.startsWith('http')
                            ? Image.network(value, fit: BoxFit.cover)
                            : Image.file(File(value), fit: BoxFit.cover),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 40,
                            color: AppColors.primaryLightColor,
                          ),
                          const SizedBox(height: AppSizes.s8),
                          Text(
                            'upload_attachment'.tr(),
                            style: AppTextStyles.font12Regular.copyWith(
                              color: AppColors.lightTextSecondary,
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _pickImage(ImageSource source) {
    ImagePickerInfo.pickImage(source, cropped: false).then((value) {
      if (value != null) {
        imageNotifier.value = value.path;
      }
    });
  }
}
