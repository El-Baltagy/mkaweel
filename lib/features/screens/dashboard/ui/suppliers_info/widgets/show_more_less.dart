part of '../suppliers_info_screen.dart';




 class ShowMoreLess extends StatelessWidget {
   const ShowMoreLess({super.key, required this.isExpandedNotifier, this.onTapAction});
   // final bool isExpanded;
   final ValueNotifier<bool> isExpandedNotifier;
   final void Function(bool)? onTapAction;
    @override
   Widget build(BuildContext context) {
     return ValueListenableBuilder(valueListenable:isExpandedNotifier , builder: (context, isExpanded, child) {
       return Row(
         children: [

           GestureDetector(
             onTap: toogleSelection,
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
             onTap:  toogleSelection,
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
       );
     },);
   }
 toogleSelection( ){
   onTapAction?.call( !isExpandedNotifier.value);
   isExpandedNotifier.value= !isExpandedNotifier.value;

 }


 }
