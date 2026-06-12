 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/constants/app_constant.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/widgets/circle_radio.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/localization.dart';
import 'package:mkaweel/main.dart';


class LangSheet extends StatefulWidget {
  const LangSheet(
      {super.key});

  @override
  State<LangSheet> createState() => _LangSheetState();
}

class _LangSheetState extends State<LangSheet> {
  final String _langCode=AppConstant.langCode;
  late ValueNotifier<int>notifier;
  late int selectedIndexLang;
  @override
  void initState() {
    // TODO: implement initState
    selectedIndexLang=CodegenLoader.supportedLocales.indexWhere((e) =>e.languageCode==(StorageHelper().readData(_langCode)??'en') );
    notifier=.new( selectedIndexLang);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    notifier.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: (CodegenLoader.supportedLocales.length*80)+60 ,
        color: AppColors.white, // Color for the background of ClipRRect
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20 ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () =>context.pop(),
                  child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20 , 0),
                      child: Icon(Icons.close)
                  ),
                ),
              ],
            ),
            ...List.generate(
                CodegenLoader.supportedLocales.length,
                    (index) => buildRow(
                    index: index,
                    langCode : CodegenLoader.supportedLocales[index].languageCode,
                      notifier: notifier
                )),
            10.verticalSpace,
            const Spacer(),
            SizedBox(
              width: context.width*0.6,
              child: ElevatedButton(
                onPressed: () async {
                  if(selectedIndexLang!=notifier.value){
                    final String lang=CodegenLoader.supportedLocales[notifier.value].languageCode;
                    await  Future.wait([
                    context.setLocale(Locale(lang)),
                      StorageHelper().writeData(_langCode, lang)
                    ]);

                  }
                   if(mounted) await context.pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: context.theme.primaryColor, // Modify to match your app theme
                ),
                child:   Text(
                  'choose_language'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget buildRow({required int index, required String langCode,required ValueNotifier<int> notifier  }) {
    return GestureDetector(
      onTap: () => notifier.value=index,
      child: Container(
          margin: const EdgeInsets.all(1.5),
          padding: const EdgeInsets.symmetric(horizontal: 10 ),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding:  const EdgeInsetsDirectional.fromSTEB(15 , 0, 0, 0),
            child: Column(
              crossAxisAlignment:  .start,
              children: [
                ValueListenableBuilder(valueListenable: notifier, builder: (context, value, child) {
                  final bool isSelected=value==index;
                  return Row(
                    crossAxisAlignment:  .start,
                    children: [
                      15.horizontalSpace,
                      CustomSelectedCircle(
                        isSelected: isSelected,
                      ),
                      10.horizontalSpace,
                      Text(langCode.tr()),

                    ],
                  );
                },),

                if (index != CodegenLoader.supportedLocales.length-1)
                  Container(
                    height: 0.5,
                    margin: const EdgeInsets.symmetric(horizontal: 30 ,vertical: 15 ),
                    color: AppColors.contractorGreyText,
                  )
              ],
            ),
          )),
    );
  }
}

extension AddBottomSheetToLangSheet on LangSheet{
  void show({bool isScrollControlled = false, bool isDismiss = false}){
    showModalBottomSheet(
        context: navigatorKey.currentContext!,
        isDismissible: isDismiss,
        backgroundColor: Colors.transparent,
        isScrollControlled: isScrollControlled,
        builder: (context) => this);
  }
}
