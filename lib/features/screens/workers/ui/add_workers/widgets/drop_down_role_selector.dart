import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/one_item_drop_down_sheet.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/drop_down_select.dart';
import 'package:mkaweel/features/screens/create_project/ui/widgets/title_with_input.dart';
import 'package:mkaweel/features/screens/workers/data/model/add_worker_data_request.dart';

class BottomSheetSelector extends StatefulWidget {
  const BottomSheetSelector({
    super.key, required this.listChoices, required this.selectedRoleNotifier, required this.isMultiSelect, required this.title, this.field,
  });
  final List<UIApiKeys> listChoices;
  final ValueNotifier<List<int>> selectedRoleNotifier;
  final  bool isMultiSelect;
  final  String title;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  @override
  State<BottomSheetSelector> createState() => _BottomSheetSelectorState();
}

class _BottomSheetSelectorState extends State<BottomSheetSelector> {
  final TextEditingController _controller=.new();
  void _listener(){
    _controller.text=    widget.selectedRoleNotifier.value?.map(
      (e) => widget.listChoices[e].uiTxt  ,
    ).toList().join(" , ")??"";
  }
  @override
  void initState() {
    // TODO: implement initState
    widget.selectedRoleNotifier.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.selectedRoleNotifier.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TitleWithInputField(
       widget.title ,

        DropDownSingleSelectData(

        field: widget.field,
             isLabel: false,
            onTap: ()=>chooseFromBottomSheet(context),
            controller:  _controller
        )
    );
  }
  void chooseFromBottomSheet(BuildContext context) {
 
    showModalBottomSheet(
      context: context,
      backgroundColor:  context.theme.scaffoldBackgroundColor,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25 ),
              topRight: Radius.circular(25 )),
          child: Container(
              padding: MediaQuery.of(context).viewInsets,
              color: context.theme.scaffoldBackgroundColor,
              child: SizedBox(
                height: 350 ,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      25.verticalSpace,
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0 , 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                        widget.isMultiSelect?
                        "you_can_choose_multi_choices".tr():
                              "choose_from_one".tr(),
                              style: TextStyle(
                                  fontSize: 15 ,
                                  color: context.theme.primaryColor,
                                  fontWeight: FontWeight.w500
                              ),),
                            Spacer(),
                            GestureDetector(
                              onTap: () =>context.pop(),
                              child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20 , 0),
                                  child: Icon(Icons.close)
                              ),
                            ),


                          ],
                        ),
                      ),
                      20.verticalSpace,
                      ValueListenableBuilder(valueListenable: widget.selectedRoleNotifier, builder: (context, value, child) {
                        return  Column(
                            children: List.generate(widget.listChoices.length, ( index) {
                              bool isSelected=value.contains(index);
                              return OneItemDropBottomSheetItem(
                                isRadio:!widget.isMultiSelect,
                                showOptionBesideRadioSelect: false,
                                style: .new(
                                    fontSize: 15,
                                    color:isSelected?context.theme.primaryColor:context.theme.colorScheme.tertiaryFixed
                                ),
                                onTap: (){
                                  if(widget.isMultiSelect){
                                    
                                    if(isSelected){
                                      widget.selectedRoleNotifier.value=value.where((e) =>
                                      e!=index).toList();
                                    }else{
                                      widget.selectedRoleNotifier.value=[
                                        ...value,
                                        index
                                      ];
                                    }
                                  }else{
                                    context.pop();
                                  widget.selectedRoleNotifier.value=[index];
                                }
                                  } ,
                                title:widget.listChoices[index] .uiTxt,
                                isLastItem: index == widget.listChoices.length-1,
                                isSelected: isSelected,
                              );
                            })
                        );
                      },),
                      20.verticalSpace,

                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
