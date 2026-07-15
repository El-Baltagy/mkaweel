part of '../suppliers_info_screen.dart';


class Supplier extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable:selectedIdNotifier , builder: (context, value, child) {
      bool isExpanded=isLoading?false:value==data.id;
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
            Header(item: data),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [

                  GestureDetector(
                    onTap: () => toogleSelection(isExpanded),
                    child: Text(
                      isExpanded?
                      'show_less_details'.tr():
                      'show_more_details'.tr(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF888780),
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap:  () => toogleSelection(isExpanded),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Transform.rotate(
                          angle: !isExpanded?pi:0,
                          child: Icon(Icons.arrow_circle_up,
                          color: context.theme.primaryColor,
                          )),
                    ),
                  )
                ],
              ),
            ),
            if(isExpanded)
            Builder(builder: (context) {
              final  List<(IconData,String, String?)>  listDetails =   [
                (Icons.phone_outlined,'phone'.tr(), data.phone),
                (Icons.email_outlined,'email'.tr(),data.email),
                (Icons.receipt_long_outlined,'tax_number'.tr(), data.tax_number),
                (Icons.location_on_outlined,'address'.tr(), data.address),
                (Icons.notes_outlined,'notes'.tr(), data.notes),
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
  toogleSelection(bool selected){
    if(selected){
      selectedIdNotifier.value=-1;
    }else{
      selectedIdNotifier.value=data.id;
    }
  }
}


class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration:   BoxDecoration(
        border: Border(top: BorderSide(color: context.theme.canvasColor, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF888780)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF888780),
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color:   Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
