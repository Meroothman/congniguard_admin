abstract class RegisterStates {}

final class RegisterInitial extends RegisterStates {}

//! Register States
final class RegisterLoadingState extends RegisterStates {}

final class RegisterSuccesState extends RegisterStates {}

final class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

//! Create user
final class CreateUserLoadingState extends RegisterStates {}

final class CreateUserSuccessState extends RegisterStates {}

final class CreateUserErrorState extends RegisterStates {
  final String error;

  CreateUserErrorState(this.error);
}

//! image picker
final class SocialProfileImagePickedSuccessState extends RegisterStates {}

final class SocialProfileImagePickedErrorState extends RegisterStates {
  String error;
  SocialProfileImagePickedErrorState(this.error);
}

//! image upload

final class UploadDoctorImageSuccessState extends RegisterStates {}

final class UploadMentorImageSuccessState extends RegisterStates {}

final class UploadVolunteerImageSuccessState extends RegisterStates {}

final class UploadImageErrorState extends RegisterStates {}

//! Password Visibilty
final class ChangePasswordVisibilityState extends RegisterStates {}

final class ChangeRePasswordVisibilityState extends RegisterStates {}
