import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/extension/double.dart';
import 'package:mkaweel/core/shared/methods/location_Service.dart';
import 'package:mkaweel/core/shared/methods/print.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/drop_down_select.dart';
import 'package:mkaweel/core/shared/widgets/text_inputs/text_input_widget.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/core/theming/app_values.dart';
class LatLng{
  final double lat, lng;
  LatLng(this.lat,this.lng);
}
class LoccationSelection extends StatelessWidget {
  const LoccationSelection({
    super.key,
    required this.locationNotifier
  });
  final   ValueNotifier<(String?,LatLng?)>locationNotifier  ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Text(
              'location' ,
              // 'site_location_gps'.tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: context.theme.colorScheme.tertiaryFixed,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async{
                PrintHelper().ordinaryPrint(".................");
                Position pos= await LocationService().getCurrentLocation() ;
                Placemark? plc=await LocationService().getPlacemark(pos) ;
                LocationService().localOfPlaceMark(val)
              },
              child: Container(
                padding: .symmetric(horizontal: 4,vertical: 8),
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(AppSizes.s8),
                ),
                child: Text(
                  'determine_current_location'.tr(),
                  style: AppTextStyles.font14Regular.copyWith(
                    color: context.theme.scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
         10.verticalSpace,
        TextInputWidget(
          data: DropDownSingleSelectData(
            icon:   Icons.my_location,
              isLabel: false,
              labelText: "Damascus - Mezzeh",
              onTap: (){

              },
              // controller:  _controller
            // 'determine_current_location'.tr()
          ),
        ),
      ],
    );
  }
}