import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/performance/service/performance_service.dart';

part 'performance_state.dart';

class PerformanceCubit extends Cubit<PerformanceState> {
  PerformanceCubit(this._service) : super(PerformanceInitial());
  final PerformanceService _service;

  static PerformanceCubit get({required BuildContext context}) => BlocProvider.of(context);
}
