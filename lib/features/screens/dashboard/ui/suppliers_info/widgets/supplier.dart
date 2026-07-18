part of '../suppliers_info_screen.dart';


class Supplier extends StatefulWidget {
  const Supplier({
    super.key,
    required this.data,
    required this.isLoading,
    required this.selectedIdNotifier,
  });

  final DataItem data;
  final bool isLoading;
  final ValueNotifier<int> selectedIdNotifier  ;

  @override
  State<Supplier> createState() => _SupplierState();
}

class _SupplierState extends State<Supplier> {
  final ValueNotifier<bool> isExpandedNotifier =.new(false) ;


  @override
  void dispose() {
    // TODO: implement dispose
    isExpandedNotifier.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable:widget.selectedIdNotifier , builder: (context, value, child) {
      bool isExpanded=widget.isLoading?false:value==widget.data.id;
      isExpandedNotifier.value=isExpanded;

      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color:
          isExpanded?
          context.theme.primaryColor:
          context.theme.canvasColor, width:isExpanded?1.5: 1),
        ),
        child: Column(
          crossAxisAlignment:  .start,
          children: [
            Header(item: widget.data),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ShowMoreLess(isExpandedNotifier: isExpandedNotifier,
                onTapAction:    ( va){
                PrintHelper().ordinaryPrint(va);

                  if(!va){
                    widget.selectedIdNotifier.value=-1;
                  }else{
                    widget. selectedIdNotifier.value=widget.data.id;
                  }
                },
              ),
            ),
            if(isExpanded)
              Builder(builder: (context) {
                final  List<(IconData,String, String?)>  listDetails =   [
                  (Icons.phone_outlined,'phone'.tr(), widget.data.phone),
                  (Icons.email_outlined,'email'.tr(),widget.data.email),
                  (Icons.receipt_long_outlined,'tax_number'.tr(), widget.data.tax_number),
                  (Icons.location_on_outlined,'address'.tr(), widget.data.address),
                  (Icons.notes_outlined,'notes'.tr(), widget.data.notes),
                ].where((e) => (e.$3 ?? '').trim() != '').toList() ;
                return Column(
                  children: [
                    ...listDetails.map(
                          (e) => _DetailRow(
                        icon:  e.$1,
                        label: e.$2,
                        value: e.$3!,
                      ),
                    ),

                  ],
                );
              },),
          ],
        ),
      );
    },);
  }
}



