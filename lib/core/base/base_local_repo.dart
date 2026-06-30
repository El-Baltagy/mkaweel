import 'dart:convert';
import 'package:mkaweel/core/storage/hive_storage.dart';

  class BaseLocalRepo {
  
  /// Persist a map to local storage.
  Future<void> saveData(String key, Map<String, dynamic> data) async {
    try {
       await HiveStorage().writeData(key, data);
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
  Future<Map<String, dynamic>? > readData(String key) async {
    try {
      //
      final data =  await HiveStorage().readData(key);
       return  data==null?null:data as Map<String, dynamic>;

    } catch (e) {
      return null;
    }
  }
}


