import 'package:dio/dio.dart';

class AddWorkerDataRequest {
  AddWorkerDataRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.dob,
    required this.phone,
    required this.specialization,
    required this.role,
    required this.avatarPath,
    required this.projectIds,
  });

  final String? name,
      email,
      password,
      dob,
      phone,
      specialization,
      role,
      avatarPath;

  final List<int> projectIds;

  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'dob': dob,
      'phone': phone,
      'specialization': specialization,
      'role': role,
      'project_ids[]': projectIds.map((e) => e.toString()).toList(),
    };

    if (avatarPath != null) {
      map['avatar'] = await MultipartFile.fromFile(
        avatarPath!,
        filename: avatarPath!.split('/').last,
      );
    }

    map.removeWhere((key, value) => value == null);

    return map;
  }
}

class UIApiKeys{
  final String uiTxt,apiValue;
  UIApiKeys(this.uiTxt,this.apiValue) ;
}