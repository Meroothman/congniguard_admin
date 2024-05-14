import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congniguard_admain/constant/const.dart';
import 'package:congniguard_admain/model/volunteer_model.dart';
import 'package:congniguard_admain/views/volunteer_view.dart';
import 'package:congniguard_admain/widgets/function_nav.dart';
import 'package:congniguard_admain/volunteer_register/volunteer_cubit/volunteer_register_state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_iconoir_ttf/flutter_iconoir_ttf.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolunteerRegisterCubit extends Cubit<VolunteerRegisterStates> {
  VolunteerRegisterCubit() : super(RegisterVolunteerInitial());

  static VolunteerRegisterCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final birthDayController = TextEditingController();

  Future<void> registerVolunteer(
      {required String email, required String password, context}) async {
    emit(RegisterVolunteerLoadingState()); //! loading state
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          createVolunteer(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phone: phoneController.text,
            bio: bioController,
            uId: value.user!.uid,
          );
          navigatTo(context, const VolunteersView());
          emit(RegisterVolunteerSuccesState());
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterVolunteerErrorState('weak password')); //! error state
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterVolunteerErrorState(
            'email already in use')); //! error state
      }
    } catch (e) {
      emit(RegisterVolunteerErrorState(e.toString())); //! error state
    }
  }

  createVolunteer({
    name,
    email,
    phone,
    password,
    uId,
    bio,
  }) {
    emit(CreateVolunteerLoadingState());

    VolunteerModel model = VolunteerModel(
        uId: uId,
        fullName: nameController.text,
        email: email,
        password: password,
        phone: phone,
        bio: bioController.text,
        image: volunteerImage);
    FirebaseFirestore.instance
        .collection('volunteers')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateVolunteerSuccessState());
    }).catchError((e) {
      emit(
        CreateVolunteerErrorState(
          e.toString(),
        ),
      );
    });
  }

  //! pick doctor Image from gallery
  File? volunteerImagePick;
  var picker = ImagePicker();
  Future<void> getVolunteerImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      volunteerImagePick = File(pickedFile.path);
      // debugPrint(doctorImagePick!.path);
      emit(VolunteerProfileImagePickedSuccessState());
      uploadImage(
        imageKind: kVolunteerImage,
        image: volunteerImagePick,
        folderName: 'volunteers',
      );
    } else {
      debugPrint('No image selected.');
      emit(VolunteerProfileImagePickedErrorState('No image selected.'));
    }
  }

  //! function to upload image to firebase storage
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
          if (imageKind == kVolunteerImage) {
            volunteerImage = value;
            emit(VolunteerUploadImageSuccessState());
          }
        }).catchError((e) {});
      },
    ).catchError((e) {
      emit(VolunteerUploadImageErrorState());
    });
  }

  IconData suffixIcon = IconoirIcons.eyeClosed;
  bool isPassword = true;

  bool isRePassword = true;
  IconData reSuffixIcon = IconoirIcons.eyeClosed;

  changePasswordVisibilityState() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? IconoirIcons.eyeClosed : IconoirIcons.eye;
    emit(ChangePasswordVisibilityVolunteerState());
  }

  changeRePasswordVisibilityState() {
    isRePassword = !isRePassword;
    reSuffixIcon = isRePassword ? IconoirIcons.eyeClosed : IconoirIcons.eye;
    emit(ChangePasswordVisibilityVolunteerState());
  }
}
