 import '../../core/api_helper/dio_error_handler.dart';
 import 'base_cubit.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Shared emit wrappers (used inside every feature-specific state)
// ─────────────────────────────────────────────────────────────────────────────

abstract class BaseEmit {}

class Loading<T> extends BaseEmit {
  final T? item;
  Loading([this.item ]);
}

class ErrorState extends BaseEmit {
  final Failure failure;
  ErrorState(this.failure);
}

class Success<T> extends BaseEmit {
  final T? data;
  final BaseRequestBackType? requestType;
  Success([this.data, this.requestType]);
}

