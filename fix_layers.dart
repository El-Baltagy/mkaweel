import 'lib/core/tools/create_auto_files/path_constants.dart';
import 'lib/core/tools/create_auto_files/repo_added_files.dart';
import 'lib/core/tools/create_auto_files/service_added_files.dart';
import 'lib/core/tools/create_auto_files/locator_add_requried_data.dart';

void main() async {
  final features = ['gantt_chart', 'invoices', 'performance', 'waste_calculator'];
  for (final f in features) {
     PathConstants().setData(f);
    
    // 1. Generate Data Layer (Repo)
    await RepoAddRequiredFiles().makeRequiredFiles('data');
    
    // 2. Generate Service Layer
    await ServiceAddRequiredFiles().makeRequiredFiles('service');
    
    // 3. Register in AppLocator
    await AddRequiredDataToSL(true).call();
  }
}
