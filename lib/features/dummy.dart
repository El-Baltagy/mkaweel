import 'package:mkaweel/features/screens/projects/data/model/project_inoices_res/project_inoices_res.dart';

  InvoiceItem emptyInvoice = InvoiceItem.fromJson( {
  "id": 14,
  "project_id": 46,
  "category_id": 24,
  "invoice_number": "INV-1010",
  "amount": 110,
  "invoice_date": "2026-07-22",
  "category_details": {
    "id": 24,
    "name": "مواد الأمن والسلامة",
    "image_path": null,
    "description": "كاميرات وأنذار حريق",
    "is_active": true,
    "type": "material"
  },
  "notes": "bbbbbbbbbb",
  "attachment": null
});

  Budgetsummary emptyBudgetSummary = Budgetsummary.fromJson( {
  "total_budget": 555,
  "total_expenses": 110,
  "remaining_budget": 445,
  "budget_consumption_percentage": 19.8,
  "currency": "SAR"
} );
