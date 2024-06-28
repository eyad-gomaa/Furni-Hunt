import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';
import 'package:furni_hunt/features/authentication/data/repo/user_repo/user_repo.dart';
import 'package:furni_hunt/features/authentication/presentation/manager/get_user_data_cubit/get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit({required this.repo}) : super(GetUserDataInitial());
  final UserRepo repo;
  UserModel? userModel;
  fetchUserData() async {
    var response = await repo.fetchUserData();
    response.fold((l) {
  userModel = l ;

      emit(GetUserDataSuccess());
    }, 
    (r) => null,
    );
  }
}
