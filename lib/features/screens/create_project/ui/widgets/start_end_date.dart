import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';

class StartEndDates extends StatelessWidget {
  const StartEndDates({
    super.key,
    required this.fieldS,
    required this.fieldE,
    required this. controllerS,
    required this. controllerE,
  })  ;

  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?) fieldS,fieldE;
  final TextEditingController  controllerS, controllerE;

  @override
  Widget build(BuildContext context) {
    final List<(String,TextEditingController,(GlobalKey<FormFieldState<dynamic>>, FocusNode?))>_list=[
      ( 'start_date'.tr(), controllerS, fieldS ),
      ( 'end_date'.tr(), controllerE, fieldE ),
    ];
    return Row(
      crossAxisAlignment:  .start,
      spacing: 10,
      children: List.generate(_list.length, (index) => Expanded(
        child: Column(
          crossAxisAlignment:  .start,
          children: [
            Text(_list[index].$1, style: AppTextStyles.font14Regular.copyWith(color: context.theme.colorScheme.tertiaryFixed)),
            10.verticalSpace,
            TextInputWidget(
                data:  DOPInputData(
                  fontSize: 13,
                  labelText:'mm/dd/yyyy',
                  field: _list[index].$3,
                  onTap: () async {
                    if(index==1&&controllerS.text.isEmpty){
                      context.showToast("please_select_start_date_first".tr() ,isSuccess: false);
                      return ;
                    }
                    DateTime  _initialDate=(index==0? DateTime.now(): DateTime.parse(controllerS.text));
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _initialDate,
                       firstDate: _initialDate,

                      lastDate: DateTime(2050),
                    );
                    if(date!=null){
                         _list[index].$2.text = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                      }
                  },
                  controller: _list[index].$2,
                )),
          ],
        ),

      ) ),
    );


  }
}