import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/values/values.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:app/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: SERVER_API_URL,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client = HttpClient(
          context: SecurityContext(withTrustedRoots: false),
        );
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );

    // 添加拦截器
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          return handler.next(response); // continue
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          ErrorEntity eInfo = createErrorEntity(e);
          onError(eInfo);
          return handler.next(e); //continue
        },
      ),
    );
  }

  void onError(ErrorEntity eInfo) {
    print('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
    switch (eInfo.code) {
      case 401:
        Global.storageService.remove(STORAGE_USER_PROFILE_KEY);
        Global.storageService.remove(STORAGE_USER_TOKEN_KEY);
        if (Global.navigatorKey.currentContext != null) {
          Navigator.of(
            Global.navigatorKey.currentContext!,
          ).pushNamedAndRemoveUntil(
            AppRoutes.Sign_in,
            (Route<dynamic> route) => false,
          );
        }
        EasyLoading.showError("Token expired, do log in again！");

        break;
      default:
        // EasyLoading.showError('unknown mistake');
        break;
    }
  }

  ErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ErrorEntity(code: 101, message: "Request to cancel");
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(
          code: 102,
          message: "request to connection time out",
        );
      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: 103, message: "request to send time out");
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: 104, message: "request to receive time out");
      case DioExceptionType.connectionError:
        return ErrorEntity(code: 105, message: "request to connection error");
      case DioExceptionType.badCertificate:
        return ErrorEntity(code: 106, message: "request to bad certificate");
      case DioExceptionType.unknown:
        return ErrorEntity(code: 107, message: "request to unknown");
      case DioExceptionType.badResponse:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : -1;
            switch (errCode) {
              case 400:
                return ErrorEntity(
                  code: errCode,
                  message: "request syntax error",
                );
              case 401:
                return ErrorEntity(code: errCode, message: "permission denied");
              case 403:
                return ErrorEntity(
                  code: errCode,
                  message: "The server refuses to execute",
                );
              case 404:
                return ErrorEntity(
                  code: errCode,
                  message: "can not connect to the server",
                );
              case 405:
                return ErrorEntity(
                  code: errCode,
                  message: "request method is forbidden",
                );
              case 500:
                return ErrorEntity(
                  code: errCode,
                  message: "internal server error",
                );
              case 502:
                return ErrorEntity(code: errCode, message: "invalid request");
              case 503:
                return ErrorEntity(code: errCode, message: "server down");
              case 505:
                return ErrorEntity(
                  code: errCode,
                  message: "Does not support HTTP protocol requests",
                );
              default:
                return ErrorEntity(
                  code: errCode,
                  message:
                      error.response != null
                          ? error.response!.statusMessage!
                          : "",
                );
            }
          } on Exception catch (_) {
            return ErrorEntity(code: 108, message: "unknown mistake");
          }
        }
    }
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var token = Global.storageService.getUserToken();
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    // EasyLoading.show(indicator: CircularProgressIndicator(),maskType: EasyLoadingMaskType.clear,dismissOnTap: true);
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    // EasyLoading.dismiss();
    return response.data;
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
