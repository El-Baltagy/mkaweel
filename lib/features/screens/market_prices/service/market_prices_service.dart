import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/market_prices/data/repo/remote/market_prices_repo.dart';

class MarketPricesService extends BaseService {
  MarketPricesService(this._remoteRepo, this._localRepo);
  
  final MarketPricesRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
