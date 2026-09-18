import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebaka/core/networking/api_result.dart';
import 'package:sebaka/features/signup/data/models/signup_request_model.dart';
import 'package:sebaka/features/signup/data/repo/signup_repo.dart';
import 'package:sebaka/features/signup/presentation/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupInitial());

  Future<void> signup(SignupRequestModel model) async {
    emit(const SignupLoading());
    final result = await _signupRepo.signup(model);
    switch (result) {
      case ApiSuccess<String>(:final data):
        emit(SignupSuccess(data));
      case ApiFailure<String>(:final message):
        emit(SignupFailure(message));
    }
  }
}
