class ApiErrorModel {
  final int? status;
  final String? message;
  final ApiErrors? errors;

  const ApiErrorModel({this.status, this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      errors: json['errors'] == null
          ? null
          : ApiErrors.fromJson(json['errors'] as Map<String, dynamic>),
    );
  }
}

class ApiErrors {
  final List<String>? email;

  const ApiErrors({this.email});

  factory ApiErrors.fromJson(Map<String, dynamic> json) {
    return ApiErrors(
      email: json['email'] == null
          ? null
          : List<String>.from(json['email'] as List),
    );
  }
}
