part of '../suppliers_info_screen.dart';
class Header extends StatelessWidget {
  const Header({
    super.key, required this.item
  });

final DataItem item;
  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF0F6E56);
    const greenBg = Color(0xFFE1F5EE);
    const muted = Color(0xFF888780);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: greenBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.local_shipping_outlined,
                color: green, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                Text(
                  item.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              if( item.company_name!=null)
              ...[
                SizedBox(height: 2),
                Text(
                  item.company_name!,
                  style: TextStyle(color: muted, fontSize: 13),
                ),
              ]
              ],
            ),
          ),
          Builder(
            builder: (context) {
              if(item.status==null){
                return SizedBox.shrink();
              }
              bool  isActive=    item.status!.toLowerCase()=='active';

              return Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: greenBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:   Text(

               ( isActive? 'active':'not_active'    ).tr(),
                  style: TextStyle(
                      color: green,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}