part of 'project_card.dart';
class LocationRow extends StatefulWidget {
  final ProjectInfoData projectInfoData;

  const LocationRow({Key? key, required this.projectInfoData}) : super(key: key);

  @override
  State<LocationRow> createState() => _LocationRowState();
}

class _LocationRowState extends State<LocationRow> {
  String? location;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLocation();


  }

  Future<void> _fetchLocation() async {
    setState(() {
      isLoading = true;
    });
    if(widget.projectInfoData.location!=null){
      location=widget.projectInfoData.location;
     }else{
      if(widget.projectInfoData.latitude==null||widget.projectInfoData.longitude==null )return ;
      final value = await LocationService().reverseGeocode(
          LatLng(double.parse(widget.projectInfoData.latitude!),
              double.parse(widget.projectInfoData.longitude!)));
      location = value?.toString();
    }
    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    if(
    widget.projectInfoData.longitude==null&&
    widget.projectInfoData.latitude==null&&
    widget.projectInfoData.location==null
    ){
      return SizedBox.shrink();
    }
    return Skeletonizer(
      enabled: isLoading,
      child: InfoRow(
        Icons.location_on,
        'location'.tr(),
        location ?? '${widget.projectInfoData.longitude}, ${widget.projectInfoData.latitude}',
        // location ?? '${widget.projectInfoData.longitude}, ${widget.projectInfoData.latitude}',
      ),
    );
  }
}
