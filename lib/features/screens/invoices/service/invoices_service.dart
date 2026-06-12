import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/invoices/data/repo/remote/invoices_repo.dart';

class InvoicesService extends BaseService {
  InvoicesService(this._remoteRepo, this._localRepo);
  
  final InvoicesRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
