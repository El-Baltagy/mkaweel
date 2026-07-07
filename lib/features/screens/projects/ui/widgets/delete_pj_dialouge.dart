import 'package:flutter/Material.dart';
import 'package:mkaweel/main.dart';

import 'package:easy_localization/easy_localization.dart';

class DeletePjDialouge extends StatelessWidget {
  const DeletePjDialouge({super.key, required this.onPressedDelete});
  final void Function()? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'delete_project'.tr(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text('are_you_sure_you_want_to_delete_this_project'.tr()),
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
