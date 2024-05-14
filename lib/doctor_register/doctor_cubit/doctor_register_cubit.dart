import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congniguard_admain/constant/const.dart';
import 'package:congniguard_admain/doctor_register/doctor_cubit/doctor_register_state.dart';
import 'package:congniguard_admain/model/doctor_model.dart';
import 'package:congniguard_admain/views/doctors_view.dart';
import 'package:congniguard_admain/views/widgets/function_nav.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_iconoir_ttf/flutter_iconoir_ttf.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorRegisterCubit extends Cubit<DoctorRegisterStates> {
  DoctorRegisterCubit() : super(RegisterDoctorInitial());

  static DoctorRegisterCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final birthDayController = TextEditingController();

  Future<void> registerDoctor(
      {required String email, required String password, context}) async {
    emit(RegisterDoctorLoadingState()); //! loading state
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          createDoctor(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phone: phoneController.text,
            bio: bioController,
            uId: value.user!.uid,
          );
          navigatTo(context, const DoctorsView());
          emit(RegisterDoctorSuccesState());
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterDoctorErrorState('weak password')); //! error state
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterDoctorErrorState('email already in use')); //! error state
      }
    } catch (e) {
      emit(RegisterDoctorErrorState(e.toString())); //! error state
    }
  }

  createDoctor({name, email, phone, password, uId, bio}) {
    emit(CreateDoctorLoadingState());

    DoctorModel model = DoctorModel(
        uId: uId,
        fullName: nameController.text,
        email: email,
        password: password,
        phone: phone,
        bio: bioController.text,
        groupsId: [],
        patientsId: [],
        image: doctorImage);
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateDoctorSuccessState());
    }).catchError((e) {
      emit(
        CreateDoctorErrorState(
          e.toString(),
        ),
      );
    });
  }

  //! pick doctor Image from gallery
  File? doctorImagePick;
  var picker = ImagePicker();
  Future<void> getDotorImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      doctorImagePick = File(pickedFile.path);
      // debugPrint(doctorImagePick!.path);
      emit(DoctorProfileImagePickedSuccessState());
      uploadImage(
        imageKind: kDoctorImage,
        image: doctorImagePick,
        folderName: 'doctors',
      );
    } else {
      debugPrint('No image selected.');
      emit(DoctorProfileImagePickedErrorState('No image selected.'));
    }
  }

  //! function to upload image to firebase storage
  String doctorImage = '';
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
            emit(DoctorUploadImageSuccessState());
          }
        }).catchError((e) {});
      },
    ).catchError((e) {
      emit(DoctorUploadImageErrorState());
    });
  }

  IconData suffixIcon = IconoirIcons.eyeClosed;
  bool isPassword = true;

  bool isRePassword = true;
  IconData reSuffixIcon = IconoirIcons.eyeClosed;

  changePasswordVisibilityState() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? IconoirIcons.eyeClosed : IconoirIcons.eye;
    emit(ChangePasswordVisibilityDoctorState());
  }

  changeRePasswordVisibilityState() {
    isRePassword = !isRePassword;
    reSuffixIcon = isRePassword ? IconoirIcons.eyeClosed : IconoirIcons.eye;
    emit(ChangePasswordVisibilityDoctorState());
  }
}
