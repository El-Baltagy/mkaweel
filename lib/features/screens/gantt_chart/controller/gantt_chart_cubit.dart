import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/gantt_chart/service/gantt_chart_service.dart';

part 'gantt_chart_state.dart';

class GanttChartCubit extends Cubit<GanttChartState> {
  GanttChartCubit(this._service) : super(GanttChartInitial());
  final GanttChartService _service;

  static GanttChartCubit get({required BuildContext context}) => BlocProvider.of(context);
}
