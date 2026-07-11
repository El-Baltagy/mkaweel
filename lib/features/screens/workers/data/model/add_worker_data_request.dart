import 'package:dio/dio.dart';

class AddWorkerDataRequest {
  AddWorkerDataRequest({
    required this.name,
    required this.email,
    required this.workerId,
    required this.password,
    required this.dob,
    required this.phone,
    required this.specialization,
    required this.role,
    required this.avatarPath,
    required this.projectIds,
   });

  final String?
  workerId,
  name,
      email,
      password,
      dob,
      phone,
      specialization,
      role,
      avatarPath;
  final List<int> projectIds;
 //  Future<Map<String, dynamic>> toJsn() async {
 //    final map = <String, dynamic>{
 //      'name': name,
 //      'email': email,
 //      'password': password,
 //      'password_confirmation': password,
 //      'dob': dob,
 //      'phone': phone,
 //      'specialization': specialization,
 //      'role': role,
 //      if (avatarPath != null)
 //        'avatar': await MultipartFile.fromFile(
 //          avatarPath!,
 //          filename: avatarPath!.split('/').last,
 //        ),
 //    };
 //
 //    map.removeWhere((key, value) => [null,''].contains( value )    );
 // return map;
 //  }


  Future<FormData> toJson() async {
    final map = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'dob': dob,
      'phone': phone,
      'specialization': specialization,
      'role': role,
      if (avatarPath != null)
        'avatar': await MultipartFile.fromFile(
          avatarPath!,
          filename: avatarPath!.split('/').last,
        ),
    };

    map.removeWhere((key, value) => [null,''].contains( value )    );
    final FormData formData = FormData.fromMap(map);

    for (final id in projectIds) {
      formData.fields.add(MapEntry('project_ids[]', id.toString()));
    }

    return formData;
  }
}

class UIApiKeys {
  final String uiTxt, apiValue;

  UIApiKeys(this.uiTxt, this.apiValue);
}
