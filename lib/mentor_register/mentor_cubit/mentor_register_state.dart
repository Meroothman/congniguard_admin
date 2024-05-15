abstract class MentorRegisterStates {}

final class RegisterMentorInitial extends MentorRegisterStates {}

//! Register States
final class RegisterMentorLoadingState extends MentorRegisterStates {}

final class RegisterMentorSuccesState extends MentorRegisterStates {}

final class RegisterMentorErrorState extends MentorRegisterStates {
  final String error;
  RegisterMentorErrorState(this.error);
}

//! Create user
final class CreateMentorLoadingState extends MentorRegisterStates {}

final class CreateDoctorSuccessState extends MentorRegisterStates {}

final class CreateMentorErrorState extends MentorRegisterStates {
  final String error;

  CreateMentorErrorState(this.error);
}
//! get doctors data

final class GetMentorLoadingState extends MentorRegisterStates {}

final class GetMentorSuccessState extends MentorRegisterStates {}

final class GetMentorErrorState extends MentorRegisterStates {
  final String error;

  GetMentorErrorState(this.error);
}

//! image picker
final class MentorProfileImagePickedSuccessState extends MentorRegisterStates {}

final class MentorProfileImagePickedErrorState extends MentorRegisterStates {
  String error;
  MentorProfileImagePickedErrorState(this.error);
}

//! image upload

final class MentorUploadImageSuccessState extends MentorRegisterStates {}

final class MentorUploadImageErrorState extends MentorRegisterStates {}

//! Password Visibilty
final class ChangePasswordVisibilityMentorState extends MentorRegisterStates {}

final class ChangeRePasswordVisibilityDoctorState
    extends MentorRegisterStates {}
