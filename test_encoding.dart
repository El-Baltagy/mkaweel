import 'dart:io'; 
import 'dart:convert'; 
void main() { 
  print(File('lib/features/screens/dashboard/ui/widgets/dashboard_header_widget.dart').readAsStringSync(encoding: utf8).contains('مكتمل')); 
}
