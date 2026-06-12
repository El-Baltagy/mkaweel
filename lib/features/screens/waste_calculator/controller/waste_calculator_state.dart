part of 'waste_calculator_cubit.dart';

class WasteCalculatorState {
  final int selectedMaterialIndex;
  final double floorArea;
  final bool isCalculated;

  const WasteCalculatorState({
    this.selectedMaterialIndex = 0,
    this.floorArea = 0.0,
    this.isCalculated = false,
  });

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
