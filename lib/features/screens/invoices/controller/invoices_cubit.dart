import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/features/screens/invoices/service/invoices_service.dart';

part 'invoices_state.dart';

class InvoicesCubit extends Cubit<InvoicesState> {
  InvoicesCubit(this._service) : super(InvoicesInitial());
  final InvoicesService _service;

  static InvoicesCubit get({required BuildContext context}) => BlocProvider.of(context);
}
