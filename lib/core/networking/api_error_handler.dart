import 'package:dio/dio.dart';
import 'package:sebaka/core/networking/api_error_model.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static String handle(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.transformTimeout:
          return 'Connection timed out. Please try again.';

        case DioExceptionType.connectionError:
          return 'No internet connection. Please check your network.';

        case DioExceptionType.badCertificate:
          return 'Security certificate error.';

        case DioExceptionType.badResponse:
          final model = ApiErrorModel.fromJson(
            error.response?.data as Map<String, dynamic>? ?? {},
          );
          return model.message ?? 'Something went wrong.';

        case DioExceptionType.cancel:
          return 'Request was cancelled.';

        case DioExceptionType.unknown:
          return 'Something went wrong. Please try again.';
      }
    }
    return 'An unexpected error occurred.';
  }
}
