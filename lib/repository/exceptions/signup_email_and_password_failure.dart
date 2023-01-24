class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email is not valid or is badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exists for this email.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation not allowed. Please contact support');
      case 'account-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This account has been disabled. Please contact support for assistance');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
