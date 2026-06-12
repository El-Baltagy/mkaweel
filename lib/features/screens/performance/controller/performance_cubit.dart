import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/performance_service.dart';

part 'performance_state.dart';

class PerformanceCubit extends Cubit<PerformanceState> {
  final PerformanceService _service;
  PerformanceCubit(this._service) : super(PerformanceInitial());

  static PerformanceCubit get({required context}) => BlocProvider.of(context);
}
