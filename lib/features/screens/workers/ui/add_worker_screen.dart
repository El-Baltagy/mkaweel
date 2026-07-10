import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/extension/form_auto_scroll.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/name_text_input_data.dart';
import 'package:mkaweel/features/screens/create_project/ui/widgets/title_with_input.dart';
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
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          title: Text(
            widget.args.workerId != null
                ? 'update_worker_data'.tr()
                : 'add_worker'.tr(),
            style: AppTextStyles.font18SemiBold.copyWith(
              color: context.theme.scaffoldBackgroundColor,
            ),
          ),
          centerTitle: true,
          leading: const SizedBox.shrink(),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: context.theme.scaffoldBackgroundColor,
              ),
              onPressed: () => context.pop(),
            ),
          ],
        ),
        body: Form(
          key: _key,
          child: ListView(
            // controller: scrollController,
            padding: const EdgeInsets.all(AppPadding.p20),
            children: [

              // const SizedBox(height: AppSizes.s20),
              TitleWithInputField(
                'worker_name'.tr(),
                NameInputData(
                  isLabel: false,
                  widgetPrefix: const SizedBox.shrink(),
                  field: field1,
                  labelText: 'full_name'.tr(),
                  controller: _nameController,
                ),
              ),
              AppSizes.s16.verticalSpace,

              TitleWithInputField(
                'specialization'.tr(),
                NameInputData(
                  isLabel: false,
                  widgetPrefix: const SizedBox.shrink(),
                  field: field2,
                  labelText: 'building'.tr(),
                  controller: _specController,
                ),
              ),
              AppSizes.s16.verticalSpace,


              TitleWithInputField(
                'phone_number'.tr(),
                NameInputData(
                  isLabel: false,
                  widgetPrefix: const SizedBox.shrink(),
                  field: field3,
                  labelText: '+966 5x xxx xxxx',
                  controller: _phoneController,
                ),
              ),
              AppSizes.s16.verticalSpace,

              TitleWithInputField(
                'certificate_expiry'.tr() ,
                DOPInputData(
                  fontSize: 13,
                  labelText:'mm/dd/yyyy',
                  field: field4,
                  onTap: () async {
                    DateTime  _initialDate= DateTime.now();
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _initialDate,
                      firstDate: _initialDate,

                      lastDate: DateTime(2050),
                    );
                    if(date!=null){
                      _residencyController.text = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                    }
                  },
                  controller: _residencyController,
                ),
              ),
              AppSizes.s16.verticalSpace,

              TitleWithInputField(
                'notes'.tr(),
                NameInputData(
                  isLabel: false,
                  widgetPrefix: const SizedBox.shrink(),
                  field: field5,
                  validator: (v) => null,
                  labelText:
                  'worker_notes_hint'.tr() + "...",
                  controller: _notesController,
                ),
              ),

              AppSizes.s24.verticalSpace,

              SizedBox(
                width: double.infinity,
                child: BlocBuilder<WorkersCubit, WorkersState>(
                  builder: (context, state) {
                    bool isLoading=true;
                    return ElevatedButton(
                      onPressed: () => addUpdateWorker(isLoading),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.s12)),
                      ),
                      child:  isLoading
                          ? CircularProgressIndicator(
                        color: context.theme.scaffoldBackgroundColor,
                      )
                          :Text(

                          'save'.tr(), style: AppTextStyles.font16SemiBold.copyWith(color: context.theme.scaffoldBackgroundColor)),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
    
  }



}


abstract class  AddWorkerPageBaseState extends State<AddWorkerPage> {
  late final WorkersCubit workersCubit;
  final _key = GlobalKey<FormState>();
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field1 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field2 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field3 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field4 = (.new(), .new());
  (GlobalKey<FormFieldState<dynamic>>, FocusNode?) field5 = (.new(), .new());
   final _nameController = TextEditingController();
  final _specController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  final _residencyController = TextEditingController();

  @override
  void initState() {
    workersCubit = WorkersCubit.get(context: context);
     super.initState();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    field1.$2?.dispose();
    field2.$2?.dispose();
    field3.$2?.dispose();
    field4.$2?.dispose();
    field5.$2?.dispose();

    _nameController.dispose();
    _specController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    _residencyController.dispose();
    super.dispose();
  }
  Future<void> addUpdateWorker(bool isLoading)async{
    if(isLoading)return ;
if (await _key.validateAndScroll(
context,
listRecorder: [field1, field2],
)) {
  // workersCubit.add
}
  }
}

//{
//     "status": "error",
//     "message": "The input data is invalid.",
//     "errors": {
//         "email": [
//             "The email has already been taken."
//         ]
//     }
// }
