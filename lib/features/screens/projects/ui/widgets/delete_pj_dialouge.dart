import 'package:flutter/Material.dart';
import 'package:mkaweel/main.dart';

import 'package:easy_localization/easy_localization.dart';

class DeletePjDialouge extends StatelessWidget {
  const DeletePjDialouge({super.key, required this.onPressedDelete, required this.title, required this.subTitle});
  final void Function()? onPressedDelete;
  final String title,subTitle;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
          title,
         style: const TextStyle(fontWeight: FontWeight.bold),
      ),
       content: Text(subTitle),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('cancel'.tr()),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            if (onPressedDelete != null) {
              onPressedDelete!();
            }
            Navigator.pop(context);
          },
          child: Text('delete'.tr()),
        ),
      ],
    );
  }
}

extension show on DeletePjDialouge{
  void toShowDialouge( ){
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => this,
    );
  }
  }
