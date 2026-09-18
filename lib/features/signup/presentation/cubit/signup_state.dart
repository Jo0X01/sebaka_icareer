sealed class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {
  const SignupInitial();
}

class SignupLoading extends SignupState {
  const SignupLoading();
}

class SignupSuccess extends SignupState {
  final String message;
  const SignupSuccess(this.message);
}

class SignupFailure extends SignupState {
  final String message;
  const SignupFailure(this.message);
}
