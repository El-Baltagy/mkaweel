import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_assets.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
 import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/login/controller/login_cubit.dart';
import 'package:mkaweel/features/screens/login/controller/login_state.dart';
import 'package:mkaweel/features/screens/login/data/model/forget_password_link/forget_password_link.dart';
 import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/email_text_input_data.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/text_input_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = .new();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());

  @override
  void dispose() {
    _emailController.dispose();
    field1.$2?.dispose();
    super.dispose();
  }

  void _onSend(LoginCubit cubit) {
    if (_formKey.currentState?.validate() ?? false) {
      cubit.sendResetPWLinkFunc(
          parameter: .new(_emailController.text.trim())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AppLocator()()()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is ForgetPasswordLinkState) {
            if (state.baseEmit is Success<ForgetPasswordLink>) {
              final data = (state.baseEmit as Success<ForgetPasswordLink>)
                  .data!;
              context.showToast(
                  data.message
              );
              Navigator.pop(context);
            } else if (state.baseEmit is ErrorState) {
              final ErrorState data =
              state.baseEmit as ErrorState;
              context.showToast(
                  data.failure.message,
                  isSuccess: false
              );
            }
          }
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'do_you_forget_password'.tr(),
              style: AppTextStyles.font18SemiBold.copyWith(
                color: context.theme.textTheme.bodyLarge?.color,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: context.theme.iconTheme.color,
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 48),

                    // Logo
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 24,
                        ),
                        child: Image.asset(
                          AppAssets.imagesLogoPng,
                          height: 80,
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Title
                    Text(
                      'do_you_forget_password'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font24Bold.copyWith(
                        color: context.theme.textTheme.bodyLarge?.color,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'enter_email_to_receive_reset_link'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font14Regular,
                    ),

                    const SizedBox(height: 32),

                    // Phone input
                    TextInputWidget(
                        data:  EmailInputData(
                          controller: _emailController,
                          field: field1,
                        )
                    ),


                    const SizedBox(height: 32),

                    // Send button
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        final isLoading = state is ForgetPasswordLinkState && state.baseEmit is Loading;
                        return isLoading ?
                        const Row(
                          mainAxisAlignment: .center,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        )
                        :ElevatedButton(
                          onPressed: ()=>_onSend(LoginCubit.get(context: context)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.theme.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'send'.tr(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}