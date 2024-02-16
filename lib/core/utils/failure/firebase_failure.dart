class Failure {
  final String failureMessage;

  Failure({required this.failureMessage});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.failureMessage});
  factory FirebaseFailure.fromFirebaseException({required failureMessage}) {
    switch (failureMessage) {
      case 'weak-password':
        return FirebaseFailure(
            failureMessage: 'The password provided is too weak.');

      case 'email-already-in-use':
        return FirebaseFailure(
            failureMessage: 'The account already exists for that email.');
      
      case 'user-not-found':
        return FirebaseFailure(
            failureMessage: 'No user found for that email.');
      
      case 'wrong-password':
        return FirebaseFailure(
            failureMessage: 'Wrong password provided for that user.');
      
      default:
        return FirebaseFailure(failureMessage: "there was an error");
    }
  }
}
