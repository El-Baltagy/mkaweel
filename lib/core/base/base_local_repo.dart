import 'dart:convert';
import 'package:mkaweel/core/storage/hive_storage.dart';

class BaseLocalRepo {
  final String? sessionId;
  BaseLocalRepo({this.sessionId});
  /// Persist a map to local storage.
  Future<void> saveData(String key,{required String randomKey,required Map<String, dynamic> savedData}) async {
    try {
       await HiveStorage().writeData(key, {
         "random_key":randomKey,
         "data":savedData,
       });
    } catch (e) {
      // Log error or handle as needed
    }
  }

  /// Remove data from local storage by key.
  Future<void> clearData(String key) async {
    try {
    } catch (e) {
      // Log error or handle as needed
    }
  }

  /// Read data from local storage by key and return as Map.
  Future<(String , Map<String, dynamic>)? > readData(String key) async {
    try {
      //
      final data =  await HiveStorage().readData(key);
       return  data==null?null: (data["random_key"] as String,data["data"]as Map<String, dynamic>);


    } catch (e) {
      return null;
    }
  }

}


