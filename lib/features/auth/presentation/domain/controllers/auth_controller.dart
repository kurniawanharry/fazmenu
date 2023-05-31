import 'package:fazmenu/core/services/storage_remote.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/features/auth/presentation/domain/entities/auth_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late BuildContext context;
  AuthArguments? arguments;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  bool isRegistered = false;
  bool? showPassword = false;
  bool? showConfirmPassword = false;

  @override
  void onInit() {
    context = Get.context!;
    update();
    if (Get.arguments != null) {
      arguments = Get.arguments;
      setAuth();
    }
    update();
    super.onInit();
  }

  setAuth() {
    if (arguments != null) {
      isRegistered = arguments?.isRegistered ?? false;
    }
  }

  ///ROUTES
  authAction() {
    if (formKey.currentState!.validate()) {
      writeStorage(name: '_email', file: emailController.value.text);
      Get.toNamed('/home');
    }
  }

  ///FUNCTION
  onChanged(String value) {
    phoneNumberController.text = useAblePhoneNumberUser(value, complete: false);
    phoneNumberController.selection =
        TextSelection.fromPosition(TextPosition(offset: phoneNumberController.text.length));
    update();
  }

  togglePassword() {
    showPassword = !showPassword!;
    update();
  }

  toggleConfirmPassword() {
    showConfirmPassword = !showConfirmPassword!;
    update();
  }
}
