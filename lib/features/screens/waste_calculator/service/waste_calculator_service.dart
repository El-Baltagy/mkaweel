import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/waste_calculator/data/repo/remote/waste_calculator_repo.dart';

class WasteCalculatorService extends BaseService {
  WasteCalculatorService(this._remoteRepo, this._localRepo);
  
  final WasteCalculatorRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
