import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/methods/image_picker.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/dialouge_choose_image.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/email_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/phone_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_cubit.dart';
import 'package:mkaweel/features/screens/settings/controller/settings_state.dart';
import 'package:mkaweel/features/screens/settings/data/model/update_profile_parameters.dart';
import 'package:mkaweel/features/screens/settings/data/model/update_profile_res/update_profile_res.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget  implements AutoRouteWrapper{
  const ProfileScreen({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) => SettingsCubit(AppLocator()()()),
      child: this,
    );
  }
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ProfilePageBaseState {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: Text(
          'profile'.tr(),
          style: AppTextStyles.font18SemiBold.copyWith(
            color: Theme.of(context).appBarTheme.foregroundColor ?? context.theme.scaffoldBackgroundColor,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        debugPrint(_avatarNotifier.value);
      },),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
             children: [
              24.verticalSpace,
               Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ValueListenableBuilder(valueListenable:_avatarNotifier , builder: (context, value, child) {

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
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: context.theme.scaffoldBackgroundColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),

              32.verticalSpace,
              _buildTextField(
                 label: 'name'.tr(),
                widget:   TextInputWidget(
                    data:  NameInputData(
                      isLabel: false,
                      controller: _nameController,
                      field: field1,
                    )
                ),
               ),
              16.verticalSpace,
              _buildTextField(
                 label: 'phone'.tr(),
                widget:   TextInputWidget(
                    data:  PhoneInputData(
                      isLabel: false,
                      controller: _phoneController,
                      field: field2,
                    )
                ),
               ),
               16.verticalSpace,
              _buildTextField(
                 label: 'email'.tr(),
               widget:   TextInputWidget(
                   data:  EmailInputData(
                     labelText: "email@gmail.com",
                     isLabel: false,
                      controller: _emailController,
                     field: field3,
                   )
               ),
                ),
              16.verticalSpace,
              _buildTextField(
                 label: 'date_of_birth'.tr(),
                widget:TextInputWidget(
              data:  DOPInputData(
                  field: field4,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() {
                        _dobController.text = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                      });
                    }

                  },
                  controller: _dobController,
                )) ,
              ),
              40.verticalSpace,
              BlocProvider(
          create: (context) => SettingsCubit(AppLocator()()()),
          child: BlocConsumer<SettingsCubit, SettingsState>(
            listener: listenerProfile,
          builder: (context, state) {
             bool isLoading=state is UpdateProfileResState && state.baseEmit is Loading;

            return isLoading?
            const CircularProgressIndicator():
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => updateProfile(context) ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.s12),
                    ),
                  ),
                   child: Text(
                    'save'.tr(),
                    style: AppTextStyles.font16SemiBold.copyWith(
                      color: context.theme.scaffoldBackgroundColor,
                    ),
                  ),
                ),
              );
          },
        ),
        ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildTextField({
     required String label,
    required Widget widget
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.font14Regular.copyWith(
            color: context.theme.primaryColor
          ),
        ),
        8.verticalSpace,
        widget
      ],
    );
  }


}
abstract class ProfilePageBaseState extends State<ProfileScreen> {
  final _key = GlobalKey<FormState>();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field3 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field4 = (.new(), .new());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final ValueNotifier<String > _avatarNotifier = .new("");
  @override
  void dispose() {
    // TODO: implement dispose
    field1.$2?.dispose();
    field2.$2?.dispose();
    field3.$2?.dispose();
    field4.$2?.dispose();

    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _avatarNotifier.dispose();
    super.dispose();
  }
  late User user;
  @override
  void initState() {
    super.initState();
    try {
      user  = StorageHelper.userData;
      _nameController.text = user.name;
      _emailController.text = user.email??"";
      _phoneController.text = user.phone??"";
      _dobController.text = user.dob;
      _avatarNotifier.value = user.avatar??"";
    } catch (e) {
      // User data might not be available or parsed correctly
    }
  }

  void pickImage(ImageSource source){
    ImagePickerInfo.pickImage(source).then((value) {
      if(value!=null){
        _avatarNotifier.value=value.path;
      }
    },);
  }

   Future<void> updateProfile(BuildContext context) async{
    if(
     _avatarNotifier.value.startsWith("http")&&
         _dobController.text.trim()==user.dob&&
         _nameController.text.trim()==user.name&&
          _emailController.text.trim()==user.email&&
        _phoneController.text.trim()==user.phone
    ){
      Navigator.pop(context);
      return ;
    }

    if (await _key.validateAndScroll(
      context,
      listRecorder: [field1, field2,field3,field4],
    )) {
      await   SettingsCubit.get(context: context).updateProfileFunc(
          parameter:  UpdateProfileParameters(
              name: _nameController.text.trim(),
              // email: null,
              email: _emailController.text.trim(),
              phone: _phoneController.text.trim(),
              date_of_birth:  _dobController.text.trim(),
              image: _avatarNotifier.value.startsWith("http")?null:_avatarNotifier.value)
      );
    }
   }

  void listenerProfile(BuildContext context,SettingsState state) {
    if(state is UpdateProfileResState){
      if(state.baseEmit  is Success<UpdateProfileRes>) {
        final UpdateProfileRes data=(state.baseEmit as Success<UpdateProfileRes>).data!;
        context.showToast(
            data.message
        );
        context.pushAndPopUntil(
          MainHomeRoute(args: const MainHomeRouteArgs()), predicate: (Route<dynamic> route) =>false,
        );
      }else
      if(state.baseEmit  is ErrorState ) {
        final ErrorState  data= state.baseEmit  as ErrorState;
        context.showToast(
            data.failure.message,
            isSuccess: false
        );

      }
    }
  }

}