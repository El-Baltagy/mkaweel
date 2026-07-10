part of 'project_card.dart';
class _LocationRow extends StatefulWidget {
  final ProjectInfoData projectInfoData;

  const _LocationRow({Key? key, required this.projectInfoData}) : super(key: key);

  @override
  State<_LocationRow> createState() => _LocationRowState();
}

class _LocationRowState extends State<_LocationRow> {
  String? location;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    if(widget.projectInfoData.latitude==null||widget.projectInfoData.longitude==null )return ;
    final value = await LocationService().reverseGeocode(
        LatLng(double.parse(widget.projectInfoData.latitude!),
            double.parse(widget.projectInfoData.longitude!)));

    if (mounted) {
      setState(() {
        location = value?.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: InfoRow(
        Icons.location_on,
        'location'.tr(),
        location ?? '${widget.projectInfoData.longitude}, ${widget.projectInfoData.latitude}',
      ),
    );
  }
}
