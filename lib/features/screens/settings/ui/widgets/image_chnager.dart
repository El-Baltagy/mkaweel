import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/methods/image_picker.dart';
import 'package:mkaweel/core/shared/widgets/dialouge_choose_image.dart';

class ImageChange extends StatelessWidget {
  const ImageChange({
    super.key,
    required this. avatarNotifier,
  })  ;

  final ValueNotifier<String>  avatarNotifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:  .bottomRight,
      children: [
        ValueListenableBuilder(valueListenable:avatarNotifier , builder: (context, value, child) {

          Widget? widgetImg;
          if (value.isNotEmpty) {
            if(value.startsWith('http')){
              widgetImg = Image.network(value,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.person, size: 50, color: Theme.of(context).primaryColor),
              );
            }else{
              widgetImg = Image.file(File(value),
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              );
            }

          }else{
            widgetImg =Icon(Icons.person, size: 50, color: Theme.of(context).primaryColor);
          }
          return ClipRRect(
            borderRadius: .circular(120),
            child: Container(
              color: context.theme.canvasColor,
              width: 100,
              height: 100 ,
              child: widgetImg,

            ),
          );
        },),
        GestureDetector(
          onTap: ()=>DialougeChooseImage(
            chooseCameraData: ('from_camera'.tr(),()=>pickImage(.camera)),
            chooseGalleryData: ('from_gallery'.tr(),()=>pickImage(.gallery)),
          ).toShowDialougePick(context),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape:  .circle,
              color: context.theme.primaryColor,
            ),
            child: Icon(
              Icons.camera_alt,
              color: context.theme.scaffoldBackgroundColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
  void pickImage(ImageSource source){
    ImagePickerInfo.pickImage(source).then((value) {
      if(value!=null){
        avatarNotifier.value=value.path;
      }
    },);
  }
}