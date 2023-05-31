import 'package:email_validator/email_validator.dart';

emptyValidator({String value = '', String fieldName = ''}) {
  if (value.isEmpty) {
    return "$fieldName wajib di isi";
  }
  return null;
}

phoneNumberValidator({String value = ''}) {
  if (value.isEmpty) {
    return "errorPhoneNumberEmpty";
  }
  if (value.isNotEmpty && value.length < 10) {
    return "Nomor telepon harus lebih dari 8 angka";
  }
  return null;
}

passwordValidator({String value = ''}) {
  if (value.isEmpty) {
    return "Password wajib di isi";
  }
  if (value.isNotEmpty && value.length < 8) {
    return "Password minimal 8 karakter";
  }
  return null;
}

emailValidator({String value = ''}) {
  if (value.isEmpty) {
    return 'Email wajib di isi';
  }
  if (!EmailValidator.validate(value)) {
    return 'Format e-mail tidak sesuai';
  }
  return null;
}
