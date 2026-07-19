part of 'change_password_screen.dart';

abstract class ChangePasswordPageBaseState extends State<ChangePasswordPage> {
  late final SettingsCubit settingsCubit;
  final _key = GlobalKey<FormState>();

  final _oldPWController = TextEditingController();
  final _newPWController = TextEditingController();
  final _newPWConfirmController = TextEditingController();
   final List<(GlobalKey<FormFieldState<dynamic>>, FocusNode?)> listFields =
  List.generate(3, (index) => (.new(), .new()));
  @override
  void initState() {
    settingsCubit = SettingsCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _oldPWController.dispose();
    _newPWController.dispose();
    _newPWConfirmController.dispose();
    super.dispose();
  }
  changePassword()async{
    if (await _key.validateAndScroll(context,listRecorder:listFields)){
      // await settingsCubit.changePassword(
      //   oldPassword: _oldPWController.text.trim(),
      //   newPassword: _newPWController.text.trim(),
      // );
    }
  }
}
