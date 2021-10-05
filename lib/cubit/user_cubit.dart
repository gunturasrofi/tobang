// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';
import 'package:tobag/models/models.dart';
import 'package:tobag/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> signUp(String firstname, String lastname, String email,
      String hp, String password) async {
    ApiReturnValue result =
        await UserServices.signUp(firstname, lastname, email, hp, password);

    if (result.value != null) {
      emit(UserSignUp(result.value!));
    } else {
      emit(UserSignUp(result.message!));
    }
  }
  // Future<void> signUp(String firstname, String lastname, String email,
  //     String hp, String password) async {
  //   ApiReturnValue<User> result =
  //       await UserServices.signUp(firstname, lastname, email, hp, password);

  //   if (result.value != null) {
  //     emit(UserLoaded(result.value!));
  //   } else {
  //     emit(UserLoadingFailed(result.message!));
  //   }
  // }

  // Future<void> uploadProfilePicture(File pictureFile) async {
  //   ApiReturnValue<String> result =
  //       await UserServices.uploadProfilePicture(pictureFile);

  //   if (result.value != null) {
  //     emit(
  //       UserLoaded(
  //         (state as UserLoaded)
  //             .user
  //             .copyWith(picturePath: baseUrlStorage + result.value),
  //       ),
  //     );
  //   }
  // }
}
