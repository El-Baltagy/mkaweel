import 'package:flutter/material.dart';
import 'package:mkaweel/core/constants/app_assets.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/widgets/asset_image.dart';


class CustomSelectedCircle extends StatelessWidget {
  const CustomSelectedCircle({
    super.key,
    required this.isSelected
  });
  final  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const CustomAssetImageWidget(AppAssets.imagesCircleSvg,
          width: 24,
          height:24 ,
        ),
        if(isSelected)
            CustomAssetImageWidget(AppAssets.imagesDotSvg,
            color: context.theme.primaryColor,
            width: 12,
            height:12 ,
          ),
      ],
    );
  }
}