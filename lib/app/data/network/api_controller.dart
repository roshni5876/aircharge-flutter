// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/constants/strings.dart';
import 'package:aircharge/app/core/constants/urls.dart';
import 'package:aircharge/app/data/models/error_model.dart';
import 'package:dio/dio.dart';

abstract class _BaseApiController {
  late Dio _dio;

  void init({required ApiVersion version}) {
    final versionString = version.name;

    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Duration(microseconds: 15000),
      receiveTimeout: Duration(microseconds: 15000),
      baseUrl: '${URLs.base}$versionString',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        HttpHeaders.acceptHeader: Headers.jsonContentType,
      },
    );

    _dio = Dio(dioOptions);
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  ErrorResponse _handleError(DioError error) {
    ErrorResponse errorResponse = ErrorResponse();

    if (error.type == DioErrorType.unknown &&
        error.error != null &&
        error.error is SocketException) {
      errorResponse =
          ErrorResponse(error: Error(detail: 'No Internet Connection'));
    }

    switch (error.type) {
      case DioErrorType.cancel:
        errorResponse = ErrorResponse(
          error: Error(detail: ErrorMessages.somethingWentWrong),
        );
        break;
      case DioErrorType.badResponse:
        if (error.response?.data != null) {
          try {
            errorResponse = ErrorResponse.fromJson(error.response!.data);
          } catch (e) {
            errorResponse = ErrorResponse(
                error: Error(detail: ErrorMessages.somethingWentWrong));
          }
        } else {
          errorResponse = ErrorResponse(
              error: Error(detail: ErrorMessages.somethingWentWrong));
        }
        break;
      case DioErrorType.connectionTimeout:
        errorResponse =
            ErrorResponse(error: Error(detail: ErrorMessages.serverTimeout));
        break;
      case DioErrorType.receiveTimeout:
        errorResponse =
            ErrorResponse(error: Error(detail: ErrorMessages.serverTimeout));
        break;
      case DioErrorType.sendTimeout:
        errorResponse =
            ErrorResponse(error: Error(detail: ErrorMessages.serverTimeout));
        break;
      case DioErrorType.unknown:
        errorResponse =
            ErrorResponse(error: Error(detail: ErrorMessages.noInternet));
        break;
      case DioExceptionType.badCertificate:
        errorResponse = ErrorResponse(
            error: Error(detail: ErrorMessages.somethingWentWrong));
        break;
      case DioExceptionType.connectionError:
        errorResponse =
            ErrorResponse(error: Error(detail: ErrorMessages.serverTimeout));
        break;
    }

    return errorResponse;
  }

  // GET
  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: query,
      );

      return response.data;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  // POST
  Future<Map<String, dynamic>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }
}

class ApiControllerV1 extends _BaseApiController {
  ApiControllerV1() {
    super.init(version: ApiVersion.v1);
  }
}
