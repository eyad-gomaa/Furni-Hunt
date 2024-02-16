import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';
import 'package:furni_hunt/features/authentication/data/repo/sign_up_repo/sign_up_repo.dart';
import 'package:meta/meta.dart';
part 'sign_up_cubit_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.repo) : super(SignUpCubitInitial());
  final SignUpRepo repo;
  void signUpWithEmail(
      {required String email,
      required String password,
      required UserModel userModel}) async {
    emit(SignUpLoading());
    var response = await repo.signUpWithEmail(email: email, password: password);
    await createUser(userModel: userModel);
    response.fold((l) => emit(SignUpSuccess(successMessage: l)),
        (r) => emit(SignUpFailure(errMessage: r.failureMessage)));
  }

  createUser({required UserModel userModel}) async {
    var response = await repo.createUser(userModel: userModel);
    response.fold((l) => null, (r) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
      }
    });
  }

  @override
  void onChange(Change<SignUpState> change) {
    print(change);
    super.onChange(change);
  }
}
