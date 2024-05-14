abstract class DoctorRegisterStates {}

final class RegisterDoctorInitial extends DoctorRegisterStates {}

//! Register States
final class RegisterDoctorLoadingState extends DoctorRegisterStates {}

final class RegisterDoctorSuccesState extends DoctorRegisterStates {}

final class RegisterDoctorErrorState extends DoctorRegisterStates {
  final String error;
  RegisterDoctorErrorState(this.error);
}

//! Create user
final class CreateDoctorLoadingState extends DoctorRegisterStates {}

final class CreateDoctorSuccessState extends DoctorRegisterStates {}

final class CreateDoctorErrorState extends DoctorRegisterStates {
  final String error;

  CreateDoctorErrorState(this.error);
}

//! image picker
final class DoctorProfileImagePickedSuccessState extends DoctorRegisterStates {}

final class DoctorProfileImagePickedErrorState extends DoctorRegisterStates {
  String error;
  DoctorProfileImagePickedErrorState(this.error);
}

//! image upload

final class DoctorUploadImageSuccessState extends DoctorRegisterStates {}

final class DoctorUploadImageErrorState extends DoctorRegisterStates {}

//! Password Visibilty
final class ChangePasswordVisibilityDoctorState extends DoctorRegisterStates {}

final class ChangeRePasswordVisibilityDoctorState
    extends DoctorRegisterStates {}
