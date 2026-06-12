import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/invoices_service.dart';

part 'invoices_state.dart';

class InvoicesCubit extends Cubit<InvoicesState> {
  final InvoicesService _service;
  InvoicesCubit(this._service) : super(InvoicesInitial());

  static InvoicesCubit get({required BuildContext context}) => BlocProvider.of(context);
}
