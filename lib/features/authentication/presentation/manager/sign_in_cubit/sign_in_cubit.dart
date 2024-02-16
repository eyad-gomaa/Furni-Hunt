import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furni_hunt/features/authentication/data/repo/sign_in_repo/sign_in_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.repo}) : super(SignInInitial());
  final SignInRepo repo;

  void signInWithEmail(

      {required String email, required String password}) async {
    try {
      emit(SignInLoading());
      var response =
          await repo.signInWithEmail(email: email, password: password);
      response.fold((l) {
        emit(SignInSuccess(successMessage: l));
      }, (r) {
        emit(SignInFailure(errMessage: r.failureMessage));
      });
    } on Exception catch (e) {
      print("error :" + e.toString());
    }
  }


void signInWithGoogle()async{
  emit(SignInLoading());
  var response = await repo.signInWithGoogle();
  await googleSignIncreateUser();
  response.fold(
    (l) => emit(SignInSuccess(successMessage: l)) , 
    (r) => emit(SignInFailure(errMessage: r.failureMessage)));
}

googleSignIncreateUser()async{
  var response = await repo.googleSignInCreateUser();
  response.fold((l) => null, (r) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
      }
    });
}
  @override
  void onChange(Change<SignInState> change) {
    super.onChange(change);
    print(change);
  }
}
