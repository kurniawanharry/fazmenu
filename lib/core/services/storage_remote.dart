import 'package:get_storage/get_storage.dart';

GetStorage _storage = GetStorage();

writeStorage({String? name, dynamic file}) {
  _storage.write(name!, file);
}

readStorage({String? keyName}) {
  return _storage.read(keyName!);
}

resetStorage() {
  _storage.erase();
}
