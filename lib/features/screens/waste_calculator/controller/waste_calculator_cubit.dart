import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/waste_calculator_service.dart';

part 'waste_calculator_state.dart';

class WasteCalculatorCubit extends Cubit<WasteCalculatorState> {
  final WasteCalculatorService _service;
  WasteCalculatorCubit(this._service) : super(const WasteCalculatorState());

  static WasteCalculatorCubit get({required context}) => BlocProvider.of(context);

  void selectMaterial(int index) {
    emit(state.copyWith(selectedMaterialIndex: index, isCalculated: false));
  }

  void updateFloorArea(double area) {
    emit(state.copyWith(floorArea: area, isCalculated: false));
  }

  void calculate() {
    emit(state.copyWith(isCalculated: true));
  }
}
