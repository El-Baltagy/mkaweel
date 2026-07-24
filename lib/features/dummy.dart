import 'package:mkaweel/features/screens/Tasks/data/model/tasks_res/tasks_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/create_project_res/create_project_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_inoices_res/project_inoices_res.dart';
import 'package:mkaweel/features/screens/projects/data/model/project_phases_res/project_phases_res.dart';

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
TaskItem getEmptyTask = TaskItem(
  id: 1,
  name: 'getEmptyItem',
  description: 'description',
  status: 'Completed',
  due_date: '2026-07-01',
  project: getEmptyProjectInfoData,
  worker: getEmptyWorker,
  project_phase: getEmptyProjectphaseItem,
);
Worker getEmptyWorker = Worker.fromJson( {
  "id": 26,
  "name": "أحمد خالدn",
  "email": "tester@gmail.com",
  "dob": "1995-12-31",
  "phone": "0955325742",
  "specialization": "construction",
  "role": "Worker",
  "avatar": "https://muqawili.app/public/assets/images/users/avatar-1.jpg",
  "created_at": "2026-07-11T00:37:56.000000Z",
  "updated_at": "2026-07-11T13:02:58.000000Z"
});
ProjectInfoData getEmptyProjectInfoData = ProjectInfoData.fromJson(
    {
      "id": 10,
      "name": "مشروع بناء مجمع سكني",
      "owner_name": "أحمد خالد",
      "start_date": "2026-01-01",
      "end_date": "2027-12-31",
      "latitude": "33.51380000",
      "longitude": "36.27650000",
      "location": null,
      "description": "مشروع بناء مجمع سكني مكون من 5 أبنية",
      "extra_details": "معلومات إضافية عن المشروع",
      "contract_value": "100000.00",
      "currency": "USD",
      "progress_percentage": 30,
      "created_at": "2026-07-05T23:03:35.000000Z",
      "updated_at": "2026-07-05T23:03:35.000000Z"
    }

);


ProjectphaseItem getEmptyProjectphaseItem =  ProjectphaseItem.fromJson( {
  "id": 13,
  "project_id": 10,
  "phase_id": 1,
  "name": "Site Preparation",
  "description": "Site handover, fencing, and temporary utilities setup",
  "planned_start_date": "2026-08-15",
  "planned_end_date": "2026-09-15",
  "actual_start_date": "2026-10-15",
  "actual_end_date": "2026-11-15",
  "progress_percentage": 10,
  "status": "in_progress",
  "notes": "تم الانتهاء من نصف أعمال الأساسات",
  "created_at": "2026-07-05T23:03:35.000000Z",
  "updated_at": "2026-07-16T01:08:32.000000Z"
});