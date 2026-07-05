import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/one_item_drop_down_sheet.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/drop_down_select.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/extension/double.dart';

class CurrencySelectorWidget extends StatefulWidget {
  const CurrencySelectorWidget({
    super.key,
    required this.listStringCurrencies,
    required this.selectedCurrencyNotifier,
  });

  final List<String> listStringCurrencies;
  final ValueNotifier<String> selectedCurrencyNotifier;

  @override
  State<CurrencySelectorWidget> createState() => _CurrencySelectorWidgetState();
}

class _CurrencySelectorWidgetState extends State<CurrencySelectorWidget> {
  final TextEditingController _controller=.new();
  void _listener(){
    _controller.text=    widget.selectedCurrencyNotifier.value;
  }
  @override
  void initState() {
    // TODO: implement initState
    widget.selectedCurrencyNotifier.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.selectedCurrencyNotifier.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'currency'.tr(),
          style: AppTextStyles.font14Regular.copyWith(
            color: context.theme.colorScheme.tertiaryFixed,
          ),
        ),
        10.verticalSpace,
        TextInputWidget(
          data: DropDownSingleSelectData(isLabel: false,
              onTap: ()=>chooseFromBottomSheet(context),
          controller:  _controller
          ),
        ),
      ],
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
                   ValueListenableBuilder(valueListenable: widget.selectedCurrencyNotifier, builder: (context, value, child) {
                     return  Column(
                         children: List.generate(widget.listStringCurrencies.length, ( index) {
                           return OneItemDropBottomSheetItem(
                             showOptionBesideRadioSelect: false,
                             style: .new(
                                 fontSize: 15,
                                 color: value==widget.listStringCurrencies[index]?context.theme.primaryColor:context.theme.colorScheme.tertiaryFixed
                             ),
                             onTap: (){
                               context.pop();
                               widget.selectedCurrencyNotifier.value=widget.listStringCurrencies[index];
                             } ,
                             title:widget.listStringCurrencies[index] ,
                             isLastItem: index == widget.listStringCurrencies.length-1,
                             isSelected:  value==widget.listStringCurrencies[index],
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
