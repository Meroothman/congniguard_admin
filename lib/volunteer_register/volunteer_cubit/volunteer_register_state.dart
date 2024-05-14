abstract class VolunteerRegisterStates {}

final class RegisterVolunteerInitial extends VolunteerRegisterStates {}

//! Register States
final class RegisterVolunteerLoadingState extends VolunteerRegisterStates {}

final class RegisterVolunteerSuccesState extends VolunteerRegisterStates {}

final class RegisterVolunteerErrorState extends VolunteerRegisterStates {
  final String error;
  RegisterVolunteerErrorState(this.error);
}

//! Create user
final class CreateVolunteerLoadingState extends VolunteerRegisterStates {}

final class CreateVolunteerSuccessState extends VolunteerRegisterStates {}

final class CreateVolunteerErrorState extends VolunteerRegisterStates {
  final String error;

  CreateVolunteerErrorState(this.error);
}

//! image picker
final class VolunteerProfileImagePickedSuccessState
    extends VolunteerRegisterStates {}

final class VolunteerProfileImagePickedErrorState
    extends VolunteerRegisterStates {
  String error;
  VolunteerProfileImagePickedErrorState(this.error);
}

//! image upload

final class VolunteerUploadImageSuccessState extends VolunteerRegisterStates {}

final class VolunteerUploadImageErrorState extends VolunteerRegisterStates {}

//! Password Visibilty
final class ChangePasswordVisibilityVolunteerState
    extends VolunteerRegisterStates {}

final class ChangeRePasswordVisibilityVolunteerState
    extends VolunteerRegisterStates {}
