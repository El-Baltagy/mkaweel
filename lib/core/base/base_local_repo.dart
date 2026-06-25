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
  Future<dynamic > readData(String key) async {
    try {
      return        await HiveStorage().readData(key);

    } catch (e) {
      return null;
    }
  }
}


