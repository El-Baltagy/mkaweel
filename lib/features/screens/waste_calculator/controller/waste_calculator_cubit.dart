import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/waste_calculator/service/waste_calculator_service.dart';
 part 'waste_calculator_state.dart';

class WasteCalculatorCubit extends Cubit<WasteCalculatorState> {
  WasteCalculatorCubit(this._service) : super(const WasteCalculatorState());
  final WasteCalculatorService _service;

  static WasteCalculatorCubit get({required BuildContext context}) => BlocProvider.of(context);

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
