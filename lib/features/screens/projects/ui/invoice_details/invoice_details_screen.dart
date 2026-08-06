import 'package:mkaweel/core/app/route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';
 
part 'invoice_details_screen_mixin.dart';

@RoutePage()
class InvoiceDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  const InvoiceDetailsPage({super.key, required this.args});
  final InvoiceDetailsRouteArgs args;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProjectsCubit>(
      create: (context) =>  AppLocator()()() ,
      child: this,
    );
  }

  @override
  State<InvoiceDetailsPage> createState() => _InvoiceDetailsPageState();
}

class _InvoiceDetailsPageState extends InvoiceDetailsPageBaseState {
  final Color tealColor = const Color(0xFF2B8C9F);

  @override
  Widget build(BuildContext context) {
    final invoice = widget.args.invoiceItem;

    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الفاتورة'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                Divider(height: 1, thickness: 1.5, color: Colors.grey.shade300),
                _buildInfoSection(invoice),
                _buildTableSection(invoice),
                Divider(height: 1, thickness: 1.5, color: Colors.grey.shade300),
                _buildFooterSection(invoice),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left side: Logo & Address
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'بغداد - جرف النداف',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '07821817284\n07702892514',
                          style: TextStyle(color: Colors.grey.shade700, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Placeholder for Logo
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange.shade300),
                    ),
                    child: const Icon(Icons.business, color: Colors.orange, size: 30),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(width: 1, thickness: 1.5, color: Colors.grey.shade300),
          // Right side: Company Name
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'هاي كوالتي للمنشآت',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: tealColor,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: const Center(
                    child: Text(
                      'فاتورة مبيعات',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('الرقم الضريبي', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(invoice) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Right: Customer info
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('اسم العميل:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 4),
                    const Text('منظفات درة بصرة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('رقم الهاتف:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 4),
                    const Text('...', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          // Left: Invoice details & barcode
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('رقم الفاتورة: ${invoice.invoice_number}', style: const TextStyle(fontSize: 12)),
                    Text('التاريخ: ${invoice.invoice_date}', style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('مطبوعة: --', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    // Fake Barcode
                    Container(
                      height: 30,
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(20, (index) {
                          return Container(
                            width: (index % 3 == 0) ? 3 : 1.5,
                            color: Colors.black,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableSection(invoice) {
    return Column(
      children: [
        // Table Header
        Container(
          color: tealColor,
          child: Row(
            children: [
              _buildTableCell('م', isHeader: true, flex: 1),
              _buildTableCell('كود', isHeader: true, flex: 2),
              _buildTableCell('صنف', isHeader: true, flex: 5),
              _buildTableCell('الوحدة', isHeader: true, flex: 2),
              _buildTableCell('كمية', isHeader: true, flex: 2),
              _buildTableCell('سعر', isHeader: true, flex: 2),
              _buildTableCell('الضريبة', isHeader: true, flex: 2),
              _buildTableCell('خصم', isHeader: true, flex: 2),
              _buildTableCell('اجمالي', isHeader: true, flex: 3),
            ],
          ),
        ),
        // Table Data Row 1 (Mapped from InvoiceItem)
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            children: [
              _buildTableCell('1', flex: 1),
              _buildTableCell('${invoice.category_id}', flex: 2),
              // _buildTableCell(invoice.category_details.name ?? 'صنف', flex: 5),
              _buildTableCell('قطعة', flex: 2),
              _buildTableCell('1.00', flex: 2),
              _buildTableCell('${invoice.amount}', flex: 2),
              _buildTableCell('0.00', flex: 2),
              _buildTableCell('0.00', flex: 2),
              _buildTableCell('${invoice.amount}', flex: 3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: isHeader ? Colors.white30 : Colors.grey.shade300)),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isHeader ? Colors.white : Colors.black87,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildFooterSection(invoice) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Right: QR Code placeholder
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  color: Colors.grey.shade100,
                ),
                child: const Icon(Icons.qr_code_2, size: 80, color: Colors.black87),
              ),
            ),
          ),
          // Left: Totals
          Expanded(
            flex: 1,
            child: Column(
              children: [
                _buildTotalRow('الاجمالي:', '${invoice.amount}'),
                _buildTotalRow('الخصم:', '0.00'),
                _buildTotalRow('الضريبة:', '0.00'),
                const SizedBox(height: 8),
                Container(
                  color: tealColor,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('المبلغ المطلوب', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      Text('${invoice.amount}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}
