import 'package:dio/dio.dart';
import 'package:sebaka/core/networking/api_constants.dart';
import 'package:sebaka/core/networking/api_error_handler.dart';
import 'package:sebaka/core/networking/api_result.dart';
import 'package:sebaka/core/services/token_storage.dart';
import 'package:sebaka/features/signup/data/models/signup_request_model.dart';

class SignupRepo {
  final Dio _dio;
  final TokenStorage _tokenStorage;

  SignupRepo(this._dio, this._tokenStorage);

  Future<ApiResult<String>> signup(SignupRequestModel model) async {
    try {
      final response = await _dio.post(
        ApiConstants.signup,
        data: model.toJson(),
      );
      final token = response.data['data']['token'] as String;
      await _tokenStorage.save(token);
      final message = response.data['message'] as String? ?? 'Success';
      return ApiSuccess(message);
    } on DioException catch (e) {
      return ApiFailure(ApiErrorHandler.handle(e));
    } catch (e) {
      return ApiFailure(ApiErrorHandler.handle(e));
    }
  }
}
