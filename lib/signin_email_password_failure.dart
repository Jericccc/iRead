class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure([this.message = "An Unknown error occurred."]);

  factory LogInWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'wrong-password' :
        return LogInWithEmailAndPasswordFailure('Please enter correct password');
      case 'invalid-email' :
        return LogInWithEmailAndPasswordFailure('Email is not valid');

      default:
        return const LogInWithEmailAndPasswordFailure();



    }
  }
}