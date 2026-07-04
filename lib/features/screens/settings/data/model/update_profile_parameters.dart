import 'package:dio/dio.dart';

class UpdateProfileParameters {
  UpdateProfileParameters({required this.name,required this.email,required this.phone,required this.date_of_birth,required this.image});
  final String? name,email,phone,date_of_birth,image;
  Future<Map<String, dynamic>> toJson() async =>{
    if(name!=null)
    'name':name,
    if(email!=null)
    'email':email,
    if(date_of_birth!=null)
    'dob':date_of_birth,
    if(phone!=null)
    'phone':phone,
    if(image!=null)
    'avatar':await MultipartFile.fromFile(
      image!,
      filename: image!.split('/').last,
    ),

  };
}