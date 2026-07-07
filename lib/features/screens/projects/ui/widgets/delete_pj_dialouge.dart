import 'package:flutter/Material.dart';
import 'package:mkaweel/main.dart';

class DeletePjDialouge extends StatelessWidget {
  const DeletePjDialouge({super.key,required this.onPressedDelete});
  final void Function()? onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
