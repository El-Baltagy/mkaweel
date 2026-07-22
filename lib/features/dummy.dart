import 'package:mkaweel/features/screens/projects/data/model/project_inoices_res/project_inoices_res.dart';

const InvoiceItem  emptyInvoice =    InvoiceItem(
  id: 0,
  project_id: 0,
  category_id: 0,
  invoice_number: 'INV-0000',
  amount: 1000,
  invoice_date: '2026-10-25',
  category_details: Categorydetails(
    id: 1,
    name: 'Category Name',
    image_path: null,
    description: 'Description',
    is_active: true,
    type: 'material',
  ),
  notes: 'Sample notes for the skeleton loader to display properly.',
  attachment: null,
);
