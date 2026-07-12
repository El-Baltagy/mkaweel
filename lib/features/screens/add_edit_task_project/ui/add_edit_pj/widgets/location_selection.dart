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
import 'package:mkaweel/features/screens/add_edit_task_project/data/model/address_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LatLng {
  final double lat, lng;

  LatLng(this.lat, this.lng);
}

class LoccationSelection extends StatefulWidget {
  const LoccationSelection({super.key, required this.locationNotifier});

  final ValueNotifier<(String?, LatLng?)> locationNotifier;

  @override
  State<LoccationSelection> createState() => _LoccationSelectionState();
}

class _LoccationSelectionState extends State<LoccationSelection> {
  final TextEditingController? _controller = .new();

  void _listener() {
    _controller?.text = widget.locationNotifier.value.$1 ?? "";
  }

  @override
  void initState() {
    // TODO: implement initState
    widget.locationNotifier.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.locationNotifier.removeListener(_listener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Text(
              'location'.tr(),
              style: AppTextStyles.font14Regular.copyWith(
                color: context.theme.colorScheme.tertiaryFixed,
              ),
            ),
            const Spacer(),
            StatefulBuilder(
              builder: (context, set) {
                return isLoading
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () async {
                          set(() {
                            isLoading = true;
                          });

                          PrintHelper().ordinaryPrint(".................");

                          final locationService = LocationService();

                          // final position = await locationService.getCurrentAddress();
                          final position = await locationService
                              .getCurrentLocation();
                          AddressModel? address;

                          address = await LocationService().reverseGeocode(
                            position.toGetLatlngFromPos(),
                          );
                          if (address != null) {
                            widget.locationNotifier.value = (
                              address.toString(),
                              LatLng(position!.latitude, position.longitude),
                            );
                          }
                          set(() {
                            isLoading = false;
                          });
                        },
                        child: Container(
                          padding: const .symmetric(horizontal: 4, vertical: 8),
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
                      );
              },
            ),
          ],
        ),
        10.verticalSpace,
        TextInputWidget(
          data: DropDownSingleSelectData(
            icon: Icons.my_location,
            isLabel: false,
            labelText: "Damascus - Mezzeh",
            onTap: () {},
            controller: _controller,
            // 'determine_current_location'.tr()
          ),
        ),
      ],
    );
  }
}
