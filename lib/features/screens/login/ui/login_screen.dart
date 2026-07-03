import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/base/base_state.dart';
import 'package:mkaweel/core/constants/app_assets.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/widgets/loading_widget_app.dart';
 import 'package:mkaweel/features/screens/login/controller/login_cubit.dart';
import 'package:mkaweel/features/screens/login/controller/login_state.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
 import 'package:mkaweel/features/screens/login/ui/forget_password.dart';
 import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/email_text_input_data.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/password_text_input_data.dart';
import 'package:mkaweel/features/screens/login/ui/widgets/text_inputs/text_input_widget.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginPageBaseState {
  final _key = GlobalKey<FormState>();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (.new(), .new());
@override
  void dispose() {
    // TODO: implement dispose
  field1.$2?.dispose();
  field2.$2?.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: loginCubitListener,
      child: Form(
        key: _key,
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    Image.asset(AppAssets.imagesLogoPng, height: 120),
                    const SizedBox(height: 48),

                     TextInputWidget(
                      data:  EmailInputData(
                        controller: emailController,
                        field: field1,
                      )
                    ),

                     const SizedBox(height: 16),
                    TextInputWidget(
                        data:  PasswordInputData(
                          controller: passwordController,
                          field: field2,
                        )
                    ),
                     const SizedBox(height: 24),
                    forgetPasswordWidget(),
                    
                    const SizedBox(height: 24),
                    // Login Button
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {

                        final isLoading = state is LoginResState && state.baseEmit is Loading;
                        return ElevatedButton(
                          onPressed: () async {
                            if (isLoading) return;
                            if (await _key.validateAndScroll(
                              context,
                              listRecorder: [field1, field2],
                            )) {
                              await argData.login(
                                parameter: .new(
                                 emailController.text.trim(),
                                    passwordController.text.trim(),
                                )
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: context.theme.primaryColor
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: LoadingWidgetApp(),
                                )
                              : Text(
                                  'login'.tr(),
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
  Widget forgetPasswordWidget(){
  return Row(
    mainAxisAlignment: .end,
    children: [
      GestureDetector(
        onTap: () => context.pushNavigation(ForgetPasswordScreen()),
        child: Text("do_you_forget_password".tr()+" ؟ ",
        style: TextStyle(
          color: context.theme.primaryColor,
          fontSize: 14,
          fontWeight: .w700
        ),
        ),
      )
    ],
  );
  }

}

abstract class LoginPageBaseState extends State<LoginPage> {
  late final LoginCubit argData;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    argData = LoginCubit.get(context: context);
    if(kDebugMode){
      emailController.text='admin@themesbrand.com';
      passwordController.text='123456';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void loginCubitListener(BuildContext context,LoginState state) {
    if (state is LoginResState) {
      if(state.baseEmit  is Success<LoginRes>) {
        final LoginRes data=(state.baseEmit as Success<LoginRes>).data!;
        context.showToast(
            data.message
        );
        context.replace(
          MainHomeRoute(args: const MainHomeRouteArgs()),
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
