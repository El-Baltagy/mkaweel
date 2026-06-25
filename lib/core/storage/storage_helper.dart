import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/storage/hive_storage.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';

abstract class StorageHelper{
  // static Future<bool> get isLogined async =>await HWSecureSaver.get(AppConstant.tokenKeyCash )!=null;
  static  bool  get isLogined   =>HiveStorage().readData(AppConstant.userKeyCash)!=null;
  static User get userData=>User.fromJson( HiveStorage().readData(AppConstant.userKeyCash));
}