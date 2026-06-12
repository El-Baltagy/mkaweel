import 'package:mkaweel/core/constants/app_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/dio_error_handler.dart';
import 'package:mkaweel/core/api_helper/dio_helper.dart';
import 'package:mkaweel/core/api_helper/response_handler.dart';
import 'package:mkaweel/core/base/base_remote_repo.dart';

class WasteCalculatorRepo extends BaseRepo {
  final DioHelper dio;
  WasteCalculatorRepo(this.dio);
}

