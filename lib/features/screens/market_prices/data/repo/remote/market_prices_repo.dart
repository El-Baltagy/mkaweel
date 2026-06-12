import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';

class MarketPricesRepo extends BaseRepo {
  MarketPricesRepo(this.dio);
  final DioHelper dio;
}

