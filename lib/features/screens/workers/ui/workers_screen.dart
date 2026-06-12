import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_state.dart';
import 'package:mkaweel/features/screens/workers/ui/widgets/AddWorkerBottomSheet.dart';
import 'package:mkaweel/features/screens/workers/ui/widgets/filter_wdgt.dart';
import 'package:mkaweel/features/screens/workers/ui/widgets/summary_card.dart';
import 'package:mkaweel/features/screens/workers/ui/widgets/workers_widgets.dart';
import 'package:mkaweel/core/extension/context.dart';

@RoutePage()
class WorkersPage extends StatefulWidget implements AutoRouteWrapper {
  const WorkersPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WorkersCubit>(
      create: (context) => WorkersCubit(AppLocator()()()),
      child: this,
    );
  }

  @override
  State<WorkersPage> createState() => _WorkersPageState();
}

class _WorkersPageState extends WorkersPageBaseState {
  String _selectedFilter = 'all_workers';

  // Mock data
  final List<WorkerModel> _allWorkers = const [
    WorkerModel(
      name: 'سيلبسيليليب',
      role: 'مشرف',
      phone: '5523454943',
      certExpiry: '19/05/2026',
      isActive: true,
    ),
  ];

  List<WorkerModel> get _filteredWorkers {
    switch (_selectedFilter) {
      case 'active':
        return _allWorkers.where((w) => w.isActive).toList();
      case 'inactive':
        return _allWorkers.where((w) => !w.isActive).toList();
      default:
        return _allWorkers;
    }
  }

  int get _activeCount => _allWorkers.where((w) => w.isActive).length;
  int get _inactiveCount => _allWorkers.where((w) => !w.isActive).length;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkersCubit, WorkersState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Text(
            'workers_management'.tr(),
            style: AppTextStyles.font18SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.add, color: context.theme.scaffoldBackgroundColor),
            onPressed: () => showAddWorkerBottomSheet(context),
          ),

        ),
        body: Column(
          children: [
            WorkersSummaryWidget(
              activeCount: _activeCount,
              inactiveCount: _inactiveCount,
            ),
            // if(false)
            WorkersFilterWidget(
              selectedFilter: _selectedFilter,
              onFilterChanged: (f) => setState(() => _selectedFilter = f),
            ),
            const SizedBox(height: AppSizes.s12),
            Expanded(child: WorkersListWidget(workers: _filteredWorkers)),
          ],
        ),
      ),
    );
  }
}

abstract class WorkersPageBaseState extends State<WorkersPage> {
  late final WorkersCubit argData;

  @override
  void initState() {
    super.initState();
    argData = WorkersCubit.get(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
