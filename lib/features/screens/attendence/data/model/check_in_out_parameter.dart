import 'package:mkaweel/features/screens/projects/ui/add_edit_pj/widgets/location_selection.dart';

class CheckInOutParameter {
  final LatLng latLng;

  final int? projectId;

  CheckInOutParameter({required this.latLng, required this.projectId});

  Map<String, dynamic> toJson() => {
    "latitude": latLng.lat.toString(),
    "longitude": latLng.lng.toString(),
    if (projectId != null)
      "project_id": '10'
      // "project_id": projectId.toString()
    else
      "work_done": "1",
  };
}
