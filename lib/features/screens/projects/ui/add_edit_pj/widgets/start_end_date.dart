import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/dob_text_input_data.dart';
import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/title_with_input.dart';

class StartEndDates extends StatelessWidget {
  const StartEndDates({
    super.key,
      this.fieldS,
      this.fieldE,
    required this. controllerS,
    required this. controllerE,
    required this.titleS, required this.titleE,
  })  ;

  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? fieldS,fieldE;
  final TextEditingController  controllerS, controllerE;
  final String titleS,titleE;
  @override
  Widget build(BuildContext context) {
    final List<(String,TextEditingController,(GlobalKey<FormFieldState<dynamic>>, FocusNode?)?)>_list=[
      (titleS , controllerS, fieldS ),
      ( titleE , controllerE, fieldE ),
    ];
    return Row(
      crossAxisAlignment:  .start,
      spacing: 10,
      children: List.generate(_list.length, (index) => Expanded(
        child: TitleWithInputField(
          _list[index].$1,
          DOPInputData(
            fontSize: 13,
            labelText:'mm/dd/yyyy',
            field: _list[index].$3,
            onTap: () async {
              if(index==1&&controllerS.text.isEmpty){
                await context.showToast("please_select_start_date_first".tr() ,isSuccess: false);
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
          ),
        )

      ) ),
    );


  }
}