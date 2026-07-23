import 'package:dio/dio.dart';
import 'package:mkaweel/core/shared/methods/print.dart';

class CreateInvoiceParameter { // File path or file name

  CreateInvoiceParameter({
    required this.amount,
    required this.invoiceDate,
    required this.category,
    required this.notes,
    required this.currency,
    required this.attachment,
    required this.projectId,
  });
  final String? amount, projectId,invoiceDate, category,notes, currency, attachment;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map= {
      'amount': amount,
      'invoice_date': invoiceDate,
      'category_id': category,
      'notes': notes,
      'currency': currency,
      'attachment': attachment,
    } ;
    map.removeWhere((key, value) =>value==null);
    PrintHelper().ordinaryPrint(map);
    return map;
  }

  Future<FormData>  toFormData () async => FormData.fromMap({
    ...toJson(),
    if(attachment!=null)
    'attachment': await MultipartFile.fromFile(
      attachment!,
      filename: attachment!.split('/').last,
    ),
  });
}