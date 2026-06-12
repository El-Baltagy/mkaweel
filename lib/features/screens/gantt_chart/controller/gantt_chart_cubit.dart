import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/gantt_chart_service.dart';

part 'gantt_chart_state.dart';

class GanttChartCubit extends Cubit<GanttChartState> {
  final GanttChartService _service;
  GanttChartCubit(this._service) : super(GanttChartInitial());

  static GanttChartCubit get({required BuildContext context}) => BlocProvider.of(context);
}
