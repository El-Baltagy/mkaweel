import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/workers/controller/workers_cubit.dart';
 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
import 'package:mkaweel/core/extension/context.dart';




@RoutePage()
class AddWorkerPage extends StatefulWidget implements AutoRouteWrapper{
  const AddWorkerPage({super.key, required this.args});
  final AddWorkerRouteArgs args;
  // 2. Implement the wrappedRoute method
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WorkersCubit>(
      // Use your singleton to get the Cubit instance
      create: (context) =>WorkersCubit(AppLocator()()()),
      child: this, // 'this' refers to the AddWorkerPage itself
    );
  }
  @override
  State<AddWorkerPage> createState() => _AddWorkerPageState();
}

class _AddWorkerPageState extends AddWorkerPageBaseState {

  @override
  Widget build(BuildContext context) {
     return BlocListener<WorkersCubit, WorkersState>(
      listener: (context, state) {
        // TODO: implement listener}
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppSizes.s12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.theme.canvasColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: ListView(
                // controller: scrollController,
                padding: const EdgeInsets.all(AppPadding.p20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                      Text('add_worker'.tr(), style: AppTextStyles.font18SemiBold),
                      const SizedBox(width: 40),
                    ],
                  ),
                  const SizedBox(height: AppSizes.s20),
                  _buildLabel('worker_name'.tr()),
                  _buildTextField(_nameController, 'full_name'.tr()),
                  const SizedBox(height: AppSizes.s16),
                  _buildLabel('specialization'.tr()),
                  _buildTextField(_specController, 'building'.tr()),
                  const SizedBox(height: AppSizes.s16),
                  _buildLabel('phone_number'.tr()),
                  _buildTextField(_phoneController, '+966 5x xxx xxxx'),
                  const SizedBox(height: AppSizes.s16),
                  _buildLabel('certificate_expiry'.tr()),
                  _buildDatePicker(context),
                  const SizedBox(height: AppSizes.s16),
                  _buildLabel('notes'.tr()),
                  _buildTextField(_notesController, 'worker_notes_hint'.tr(), maxLines: 3),
                  const SizedBox(height: AppSizes.s24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.s12)),
                      ),
                      child: Text('save'.tr(), style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
  Widget _buildLabel(String label) => Padding(
    padding: const EdgeInsets.only(bottom: AppPadding.p8),
    child: Text(label, style: AppTextStyles.font14Regular.copyWith(color: context.theme.colorScheme.tertiaryFixed), textAlign: TextAlign.right),
  );

  Widget _buildTextField(TextEditingController ctrl, String hint, {int maxLines = 1}) => TextField(
    controller: ctrl,
    maxLines: maxLines,
    textAlign: TextAlign.right,
    // textDirection: TextDirection.rtl,
    decoration: InputDecoration(
      hintText: hint,
      // hintTextDirection: TextDirection.rtl,
      filled: true,
      fillColor: context.theme.scaffoldBackgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.s8),
        borderSide:   BorderSide(color: context.theme.canvasColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.s8),
        borderSide:   BorderSide(color: context.theme.canvasColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.s8),
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
    ),
  );

  Widget _buildDatePicker(BuildContext context) => InkWell(
    onTap: () async {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
      );
      if (date != null) setState(() => _selectedDate = date);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p14),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.s8),
        border: Border.all(color: context.theme.canvasColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.calendar_today_outlined, color: AppColors.contractorGreyText),
          Text(
            _selectedDate != null
                ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                : 'mm/dd/yyyy',
            style: AppTextStyles.font14Regular,
          ),
        ],
      ),
    ),
  );
}


abstract class  AddWorkerPageBaseState extends State<AddWorkerPage> {
  late final WorkersCubit workersCubit;
  final _nameController = TextEditingController();
  final _specController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime? _selectedDate;
  @override
  void initState() {
    workersCubit = WorkersCubit.get(context: context);
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
