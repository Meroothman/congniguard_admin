import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congniguard_admain/constant/const.dart';
import 'package:congniguard_admain/register/model/doctor_model.dart';
import 'package:congniguard_admain/register/model/volunteer_model.dart';
import 'package:congniguard_admain/views/admain_page.dart';
import 'package:congniguard_admain/views/widgets/function_nav.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_iconoir_ttf/flutter_iconoir_ttf.dart';
import 'package:image_picker/image_picker.dart';
import 'register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final birthDayController = TextEditingController();

  // Future<void> registermentor(
  //     {required String email, required String password, context}) async {
  //   emit(RegisterLoadingState()); //! loading state
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     )
  //         .then(
  //       (value) {
  //         createMentor(
  //           name: nameController.text,
  //           email: emailController.text,
  //           password: passwordController.text,
  //           phone: phoneController.text,
  //           age: ageController.text,
  //           birthDay: birthDayController.text,
  //           uId: value.user!.uid,
  //         );
  //         emit(RegisterSuccesState());
  //         //  CacheHelper.saveData(key: 'uId', value: value.user!.uid);
  //         //   uId = CacheHelper.getData(key: 'uId');

  //         navigatTo(context, const AdmainPage());
  //         emit(RegisterSuccesState());
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       emit(RegisterErrorState('weak password')); //! error state
  //     } else if (e.code == 'email-already-in-use') {
  //       emit(RegisterErrorState('email already in use')); //! error state
  //     }
  //   } catch (e) {
  //     emit(RegisterErrorState(e.toString())); //! error state
  //   }
  // }

  // createMentor({
  //   name,
  //   email,
  //   phone,
  //   password,
  //   uId,
  //   age,
  //   birthDay,
  // }) {
  //   emit(CreateUserLoadingState());

  //   UserModel model = UserModel(
  //     fullName: name,
  //     email: email,
  //     password: password,
  //     phone: phone,
  //     age: age,
  //     birthDay: birthDay,
  //     uId: uId,
  //   );
  //   FirebaseFirestore.instance
  //       .collection('doctors')
  //       .doc(uId)
  //       .set(model.toMap())
  //       .then((value) {
  //     emit(CreateUserSuccessState());
  //   }).catchError((e) {
  //     emit(
  //       CreateUserErrorState(
  //         e.toString(),
  //       ),
  //     );
  //   });
  // }

  // Future<void> registerVolunteer(
  //     {required String email,
  //     required String password,
  //     required String collectionName,
  //     context}) async {
  //   emit(RegisterLoadingState()); //! loading state
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     )
  //         .then(
  //       (value) {
  //         createMentor(
  //           name: nameController.text,
  //           email: emailController.text,
  //           password: passwordController.text,
  //           phone: phoneController.text,
  //           age: ageController.text,
  //           birthDay: birthDayController.text,
  //           uId: value.user!.uid,
  //         );
  //         emit(RegisterSuccesState());
  //         //  CacheHelper.saveData(key: 'uId', value: value.user!.uid);
  //         //   uId = CacheHelper.getData(key: 'uId');

  //         navigatTo(context, const AdmainPage());
  //         emit(RegisterSuccesState());
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       emit(RegisterErrorState('weak password')); //! error state
  //     } else if (e.code == 'email-already-in-use') {
  //       emit(RegisterErrorState('email already in use')); //! error state
  //     }
  //   } catch (e) {
  //     emit(RegisterErrorState(e.toString())); //! error state
  //   }
  // }

  // createVolunteer(
  //     {name,
  //     email,
  //     phone,
  //     password,
  //     uId,
  //     age,
  //     birthDay,
  //     required String collectionName}) {
  //   emit(CreateUserLoadingState());

  //   UserModel model = UserModel(
  //     fullName: name,
  //     email: email,
  //     password: password,
  //     phone: phone,
  //     age: age,
  //     birthDay: birthDay,
  //     uId: uId,
  //   );
  //   FirebaseFirestore.instance
  //       .collection(collectionName)
  //       .doc(uId)
  //       .set(model.toMap())
  //       .then((value) {
  //     emit(CreateUserSuccessState());
  //   }).catchError((e) {
  //     emit(
  //       CreateUserErrorState(
  //         e.toString(),
  //       ),
  //     );
  //   });
  // }

  // Future<void> registerDoctor(
  //     {required String email, required String password, image, context}) async {
  //   emit(RegisterLoadingState()); //! loading state
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     )
  //         .then(
  //       (value) {
  //         createDoctor(
  //           name: nameController.text,
  //           email: emailController.text,
  //           password: passwordController.text,
  //           phone: phoneController.text,
  //           bio: bioController,
  //           uId: value.user!.uid,
  //         );
  //         emit(RegisterSuccesState());
  //         //  CacheHelper.saveData(key: 'uId', value: value.user!.uid);
  //         //   uId = CacheHelper.getData(key: 'uId');

  //         navigatTo(context, const AdmainPage());
  //         emit(RegisterSuccesState());
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       emit(RegisterErrorState('weak password')); //! error state
  //     } else if (e.code == 'email-already-in-use') {
  //       emit(RegisterErrorState('email already in use')); //! error state
  //     }
  //   } catch (e) {
  //     emit(RegisterErrorState(e.toString())); //! error state
  //   }
  // }

  // createDoctor({
  //   name,
  //   email,
  //   phone,
  //   password,
  //   uId,
  //   bio,
  //   image,
  // }) {
  //   emit(CreateUserLoadingState());

  //   DoctorModel model = DoctorModel(
  //       uId: uId,
  //       fullName: nameController.text,
  //       email: email,
  //       password: password,
  //       phone: phone,
  //       bio: bioController.text,
  //       groupsId: [],
  //       patientsId: [],
  //       image: doctorImage);
  //   FirebaseFirestore.instance
  //       .collection('doctors')
  //       .doc(uId)
  //       .set(model.toMap())
  //       .then((value) {
  //     emit(CreateUserSuccessState());
  //   }).catchError((e) {
  //     emit(
  //       CreateUserErrorState(
  //         e.toString(),
  //       ),
  //     );
  //   });
  // }

  //! pick doctor Image from gallery
  File? doctorImagePick;
  var picker = ImagePicker();
  Future<void> getDotorImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      doctorImagePick = File(pickedFile.path);
      debugPrint(doctorImagePick!.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(SocialProfileImagePickedErrorState('No image selected.'));
    }
  }

  //! pick doctor Image from gallery
  File? mentroImagePick;

  Future<void> getMentorrImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      mentroImagePick = File(pickedFile.path);
      debugPrint(mentroImagePick!.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(SocialProfileImagePickedErrorState('No image selected.'));
    }
  }

  //! pick doctor Image from gallery
  File? volunteerImagePick;

  Future<void> getvolunteerImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      volunteerImagePick = File(pickedFile.path);
      debugPrint(volunteerImagePick!.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(SocialProfileImagePickedErrorState('No image selected.'));
    }
  }

  //! function to upload image to firebase storage
  String doctorImage = '';
  String mentorImage = '';
  String volunteerImage = '';
  //? note according to the single rsponsipility principle
  void uploadImage({imageKind, image, folderName}) {
    FirebaseStorage.instance
        .ref()
        .child('$folderName/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then(
      (value) {
        value.ref.getDownloadURL().then((value) {
          debugPrint(value);
          if (imageKind == kDoctorImage) {
            doctorImage = value;
            emit(UploadDoctorImageSuccessState());
          } else if (imageKind == kMentorImage) {
            mentorImage = value;
            emit(UploadMentorImageSuccessState());
          } else if (imageKind == kVolunteerImage) {
            volunteerImage = value;
            emit(UploadVolunteerImageSuccessState());
          }
        }).catchError((e) {
          emit(UploadImageErrorState());
        });
      },
    ).catchError((e) {
      emit(UploadImageErrorState());
    });
  }

  IconData suffixIcon = IconoirIcons.eyeClosed;
  bool isPassword = true;

  bool isRePassword = true;
  IconData reSuffixIcon = IconoirIcons.eyeClosed;

  changePasswordVisibilityState() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? IconoirIcons.eyeClosed : IconoirIcons.eye;
    emit(ChangePasswordVisibilityState());
  }

  changeRePasswordVisibilityState() {
    isRePassword = !isRePassword;
    reSuffixIcon = isRePassword ? IconoirIcons.eyeClosed : IconoirIcons.eye;
    emit(ChangePasswordVisibilityState());
  }
}
