import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/storage/hive_storage.dart';
import 'package:mkaweel/features/screens/login/data/model/login_res/login_res.dart';
import 'package:token_saver/secure_token_manager.dart';

abstract class StorageHelper{
  static Future<String?> get getToken async =>await HWSecureSaver.get(AppConstant.tokenKeyCash ) ;
  static  bool  get isLogined   =>HiveStorage().readData(AppConstant.userKeyCash)!=null;
  static  bool  get hasViewedOnboarding =>HiveStorage().readData(AppConstant.onboardingKeyCash)!=null;
  static User get userData {
    final data = HiveStorage().readData(AppConstant.userKeyCash);
    return User.fromJson(data is Map ? Map<String, dynamic>.from(data) : data);
  }
}