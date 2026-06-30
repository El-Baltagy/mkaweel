import 'package:dio/dio.dart';
import 'package:mkaweel/core/api_helper/interceptor/auth_interceptor.dart';
import 'package:mkaweel/core/api_helper/interceptor/logger_interceptor.dart';
import 'package:mkaweel/core/constants/app_api.dart';
import 'package:mkaweel/core/storage/storage_helper.dart';

class DioHelper {
  late Dio _dio;
  Dio get dio => _dio;


  DioHelper call() {
    _dio = Dio(
      BaseOptions(

        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'X-App-Flavor': AppFlavorConfig.instance.flavor.name,
        },
      ),
    );

    _dio.interceptors.addAll([
      LoggerInterceptor(),
      AuthInterceptor(dio: _dio, getAccessToken: () async => await StorageHelper.getToken, refreshToken: () async => null),
    ]);

    return this;
  }

  Future<dynamic> getData({
    required String uri,
    CancelToken? cancelToken,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    String? caller,
  }) async {
    final res = await _dio.get(
      uri,
      cancelToken: cancelToken,
      queryParameters: query,
      options: Options(
        responseType: ResponseType.plain,
        headers: headers,
        extra: {'caller': caller},
      ),
    );
    return res.data;
  }

  Future<dynamic> postData({
    required String uri,
    CancelToken? cancelToken,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    String? caller,
  }) async {
    final res = await _dio.post(
      uri,
      cancelToken: cancelToken,
      data: data,
      queryParameters: query,
      options: Options(
        responseType: ResponseType.plain,
        headers: headers,
        extra: {'caller': caller},
      ),
    );
    return res.data;
  }

  Future<dynamic> deleteData({
    required String uri,
    CancelToken? cancelToken,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    String? caller,
  }) async {
    final res = await _dio.delete(
      uri,
      cancelToken: cancelToken,
      data: data,
      queryParameters: query,
      options: Options(
        responseType: ResponseType.plain,
        headers: headers,
        extra: {'caller': caller},
      ),
    );
    return res.data;
  }

}
