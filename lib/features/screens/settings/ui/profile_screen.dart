import 'package:flutter/material.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/email_text_input_data.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/phone_text_input_data.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/text_input_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _key = GlobalKey<FormState>();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field3 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field4 = (.new(), .new());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
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
      super.dispose();
  }



  String _avatarUrl = '';

  @override
  void initState() {
    super.initState();
    try {
      final user = StorageHelper.userData;
      _nameController.text = user.name;
      _phoneController.text = user.phone;
      _dobController.text = user.dob;
      _avatarUrl = user.avatar;
    } catch (e) {
      // User data might not be available or parsed correctly
    }
  }



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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment:  .center,
          children: [
            24.verticalSpace,
            // Image Picker Placeholder
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.canvasColor,
                    image: _avatarUrl.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(_avatarUrl),
                            fit: BoxFit.cover,
                            onError: (exception, stackTrace) => const SizedBox(),
                          )
                        : null,
                  ),
                  child: _avatarUrl.isEmpty
                      ? Icon(Icons.person, size: 50, color: Theme.of(context).primaryColor)
                      : null,
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Implement Image Picker logic here
                  },
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
            // _buildTextField(
            //    label: 'date_of_birth'.tr(),
            //   widget: DOBInput(
            //     field: field3,
            //     controller: _dobController,
            //   ),
            //    // readOnly: true,
            //   // onTap: () async {
            //   //   // TODO: Date Picker Logic if needed or handle by user
            //   //   final date = await showDatePicker(
            //   //     context: context,
            //   //     initialDate: DateTime.now(),
            //   //     firstDate: DateTime(1900),
            //   //     lastDate: DateTime.now(),
            //   //   );
            //   //   if (date != null) {
            //   //     setState(() {
            //   //       _dobController.text = "\${date.year}-\${date.month.toString().padLeft(2, '0')}-\${date.day.toString().padLeft(2, '0')}";
            //   //     });
            //   //   }
            //   // },
            // ),
            40.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement save logic
                },
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
            ),
          ],
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
