part of 'waste_calculator_cubit.dart';

class WasteCalculatorState {

  const WasteCalculatorState({
    this.selectedMaterialIndex = 0,
    this.floorArea = 0.0,
    this.isCalculated = false,
  });
  final int selectedMaterialIndex;
  final double floorArea;
  final bool isCalculated;

  WasteCalculatorState copyWith({
    int? selectedMaterialIndex,
    double? floorArea,
    bool? isCalculated,
  }) {
    return WasteCalculatorState(
      selectedMaterialIndex: selectedMaterialIndex ?? this.selectedMaterialIndex,
      floorArea: floorArea ?? this.floorArea,
      isCalculated: isCalculated ?? this.isCalculated,
    );
  }
}
