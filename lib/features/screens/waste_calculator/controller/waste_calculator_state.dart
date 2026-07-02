part of 'waste_calculator_cubit.dart';

@immutable
abstract class WasteCalculatorState {}


/// Single combined state — both slices are always present together.
/// This prevents one request's emission from wiping the other's data.
class WasteCalculatorLoaded extends WasteCalculatorState {
  final BaseEmit? wasteCalcEmit ;
  final WasteCalculatorState? refreshOrInit;

  WasteCalculatorLoaded({
     this.wasteCalcEmit,
    this.refreshOrInit,
   });

  WasteCalculatorLoaded copyWith({
    BaseEmit? wasteCalcEmit,
      WasteCalculatorState? refreshOrInit,
  }) {
    return WasteCalculatorLoaded(
      refreshOrInit: refreshOrInit ?? this.refreshOrInit,
       wasteCalcEmit: wasteCalcEmit ?? this.wasteCalcEmit,
     );
  }
}



