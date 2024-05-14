import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congniguard_admain/constant/const.dart';
import 'package:congniguard_admain/mentor_register/mentor_cubit/mentor_register_state.dart';
import 'package:congniguard_admain/register/model/mentor_model.dart';
import 'package:congniguard_admain/views/mentors_view.dart';
import 'package:congniguard_admain/views/widgets/function_nav.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_iconoir_ttf/flutter_iconoir_ttf.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MentorRegisterCubit extends Cubit<MentorRegisterStates> {
  MentorRegisterCubit() : super(RegisterMentorInitial());

  static MentorRegisterCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> registermentor(
      {required String email, required String password, context}) async {
    emit(RegisterMentorLoadingState()); //! loading state
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          createMentor(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phone: phoneController.text,
            uId: value.user!.uid,
          );
          navigatTo(context, const MentorsView());
          emit(RegisterMentorSuccesState());
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterMentorErrorState('weak password')); //! error state
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterMentorErrorState('email already in use')); //! error state
      }
    } catch (e) {
      emit(RegisterMentorErrorState(e.toString())); //! error state
    }
  }

  createMentor({name, email, phone, password, uId}) {
    emit(CreateMentorLoadingState());

    MentorModel model = MentorModel(
      uId: uId,
      fullName: nameController.text,
      email: email,
      password: password,
      phone: phone,
      bio: bioController.text,
      groupsId: [],
      image: mentorImage,
    );
    FirebaseFirestore.instance
        .collection('mentors')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(RegisterMentorSuccesState());
    }).catchError((e) {
      emit(
        RegisterMentorErrorState(e.toString()),
      );
    });
  }

  //! pick mentor Image from gallery
  File? mentroImagePick;
  var picker = ImagePicker();

  Future<void> getMentorImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      mentroImagePick = File(pickedFile.path);
      uploadImage(
          image: mentroImagePick,
          imageKind: kMentorImage,
          folderName: 'mentors');
      emit(MentorProfileImagePickedSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(MentorProfileImagePickedErrorState('No image selected.'));
    }
  }

  //! function to upload image to firebase storage
  String mentorImage = '';
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
          if (imageKind == kMentorImage) {
            mentorImage = value;
            emit(MentorUploadImageSuccessState());
          }
        }).catchError((e) {
          emit(MentorUploadImageErrorState());
        });
      },
    ).catchError((e) {
      emit(MentorUploadImageErrorState());
    });
  }

  IconData suffixIcon = IconoirIcons.eyeClosed;
  bool isPassword = true;

  bool isRePassword = true;
  IconData reSuffixIcon = IconoirIcons.eyeClosed;

  changePasswordVisibilityState() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? IconoirIcons.eyeClosed : IconoirIcons.eye;
    emit(ChangePasswordVisibilityMentorState());
  }

  changeRePasswordVisibilityState() {
    isRePassword = !isRePassword;
    reSuffixIcon = isRePassword ? IconoirIcons.eyeClosed : IconoirIcons.eye;
    emit(ChangePasswordVisibilityMentorState());
  }
}
