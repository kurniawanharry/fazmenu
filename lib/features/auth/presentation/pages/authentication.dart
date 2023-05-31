import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/util/validator.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/features/auth/presentation/domain/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (get) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: FazColors.white,
                leading: MaterialButton(
                  child: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: get.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            get.isRegistered ? 'LOGIN' : 'REGISTER',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 5,
                                ),
                          ),
                        ),
                        // _username(get),
                        // _whatsapp(context, get),
                        _email(get),
                        _password(get),
                        // _passwordConfirm(get),
                        _forgotPassword(get),
                        _continueButton(context, get),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget _username(AuthController get) {
  //   return Visibility(
  //     visible: !get.isRegistered,
  //     child: Padding(
  //       padding: const EdgeInsets.only(bottom: 10),
  //       child: Column(
  //         children: [
  //           const TitleListTile(
  //             icon: Icons.person,
  //             title: 'Username',
  //             isNeeded: true,
  //           ),
  //           SingleLineField(
  //             autovalidateMode: AutovalidateMode.onUserInteraction,
  //             smartDashesType: SmartDashesType.enabled,
  //             inputAction: TextInputAction.next,
  //             inputType: TextInputType.text,
  //             controller: get.userNameController,
  //             hint: 'Username',
  //             validator: (value) {
  //               return emptyValidator(value: value!, fieldName: 'Username');
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _whatsapp(BuildContext context, AuthController get) {
  //   return Visibility(
  //     visible: !get.isRegistered,
  //     child: Padding(
  //       padding: const EdgeInsets.only(bottom: 10),
  //       child: Column(
  //         children: [
  //           const TitleListTile(
  //             icon: Icons.phone,
  //             title: 'No Telepon',
  //             isNeeded: true,
  //           ),
  //           SingleLineField(
  //             autovalidateMode: AutovalidateMode.onUserInteraction,
  //             smartDashesType: SmartDashesType.enabled,
  //             inputAction: TextInputAction.next,
  //             inputType: TextInputType.phone,
  //             controller: get.phoneNumberController,
  //             length: 14,
  //             onChanged: (value) {
  //               get.onChanged(value);
  //             },
  //             prefixIcon: Padding(
  //               padding: const EdgeInsets.only(left: 10),
  //               child: Text(
  //                 '62',
  //                 style:
  //                     Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
  //               ),
  //             ),
  //             hint: 'No Telepon',
  //             prefixIconConstraints: const BoxConstraints(minWidth: 35, maxWidth: 40),
  //             inputFormatters: [
  //               FilteringTextInputFormatter.allow(RegExp(Constants.phoneNumberAllowance)),
  //             ],
  //             validator: (value) {
  //               return phoneNumberValidator(value: value!);
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _email(AuthController get) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          const TitleListTile(
            icon: Icons.email,
            title: 'Email',
            isNeeded: true,
          ),
          SingleLineField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            smartDashesType: SmartDashesType.enabled,
            inputAction: TextInputAction.next,
            inputType: TextInputType.emailAddress,
            controller: get.emailController,
            hint: 'Email',
            validator: (value) {
              return emailValidator(value: value!);
            },
          ),
        ],
      ),
    );
  }

  Widget _password(AuthController get) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          const TitleListTile(
            icon: Icons.password_rounded,
            title: 'Password',
            isNeeded: true,
          ),
          SingleLineField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            smartDashesType: SmartDashesType.enabled,
            inputAction: TextInputAction.next,
            inputType: TextInputType.text,
            controller: get.passwordController,
            hint: 'Password',
            obscureText: !get.showPassword!,
            suffixIcon: InkWell(
              onTap: get.togglePassword,
              child: Icon(
                  get.showPassword ?? false
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: FazColors.gray[400],
                  size: 20),
            ),
            suffixIconConstraints: const BoxConstraints(minWidth: 45, maxWidth: 50),
            validator: (value) {
              return passwordValidator(value: value!);
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
              FilteringTextInputFormatter.deny(RegExp(
                  '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _passwordConfirm(AuthController get) {
  //   return Visibility(
  //     visible: !get.isRegistered,
  //     child: Padding(
  //       padding: const EdgeInsets.only(bottom: 10),
  //       child: Column(
  //         children: [
  //           const TitleListTile(
  //             icon: Icons.password_rounded,
  //             title: 'Password Confirm',
  //             isNeeded: true,
  //           ),
  //           SingleLineField(
  //             autovalidateMode: AutovalidateMode.onUserInteraction,
  //             smartDashesType: SmartDashesType.enabled,
  //             inputAction: TextInputAction.done,
  //             inputType: TextInputType.text,
  //             controller: get.passwordConfirmController,
  //             hint: 'Password',
  //             obscureText: !get.showConfirmPassword!,
  //             suffixIcon: InkWell(
  //               onTap: get.toggleConfirmPassword,
  //               child: Icon(
  //                   get.showConfirmPassword ?? false
  //                       ? Icons.visibility_off_rounded
  //                       : Icons.visibility_rounded,
  //                   color: FazColors.gray[400],
  //                   size: 20),
  //             ),
  //             suffixIconConstraints: const BoxConstraints(minWidth: 45, maxWidth: 50),
  //             validator: (value) {
  //               return passwordValidator(value: value!);
  //             },
  //             inputFormatters: [
  //               LengthLimitingTextInputFormatter(30),
  //               FilteringTextInputFormatter.deny(RegExp(
  //                   '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _forgotPassword(AuthController get) {
    return Visibility(
      visible: get.isRegistered,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Forgot Password?'),
          ),
        ],
      ),
    );
  }

  Widget _continueButton(BuildContext context, AuthController get) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: get.authAction,
            child: Text(get.isRegistered ? 'Login' : 'Register'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'ATAU',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/png/google.png',
              width: 20,
              height: 20,
            ),
            label: const Text('Login dengan Google'),
          ),
        ],
      ),
    );
  }
}
