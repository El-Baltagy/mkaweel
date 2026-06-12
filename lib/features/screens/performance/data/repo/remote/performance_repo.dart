import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';

class PerformanceRepo extends BaseRepo {
  PerformanceRepo(this.dio);
  final DioHelper dio;
}

