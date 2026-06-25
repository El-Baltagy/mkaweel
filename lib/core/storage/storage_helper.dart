import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/storage/hive_storage.dart';
import 'package:token_saver/secure_token_manager.dart';

abstract class StorageHelper{
  // static Future<bool> get isLogined async =>await HWSecureSaver.get(AppConstant.tokenKeyCash )!=null;
  static  bool  get isLogined   =>HiveStorage().readData(AppConstant.userKeyCash)!=null;
}