import 'package:mkaweel/core/base/base_service.dart';
import 'package:mkaweel/core/base/base_local_repo.dart';
import 'package:mkaweel/features/screens/gantt_chart/data/repo/remote/gantt_chart_repo.dart';

class GanttChartService extends BaseService {
  GanttChartService(this._remoteRepo, this._localRepo);
  
  final GanttChartRepo _remoteRepo;
  final BaseLocalRepo _localRepo;
}
