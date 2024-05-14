import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:congniguard_admain/constant/const.dart';
import 'package:congniguard_admain/doctor_register/doctor_cubit/doctor_register_cubit.dart';
import 'package:congniguard_admain/doctor_register/doctor_cubit/doctor_register_state.dart';
import 'package:congniguard_admain/register/register_cubit/volunteer_register_cubit.dart';
import 'package:congniguard_admain/views/widgets/custom_app_button.dart';
import 'package:congniguard_admain/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconoir_ttf/flutter_iconoir_ttf.dart';

class DocotrRegister extends StatelessWidget {
  const DocotrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return BlocConsumer<DoctorRegisterCubit, DoctorRegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorRegisterCubit.get(context);
        var doctorImage = cubit.doctorImagePick;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 74,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage: doctorImage == null
                                      ? const NetworkImage(
                                          'https://as2.ftcdn.net/v2/jpg/03/83/25/83/1000_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                                        )
                                      : FileImage(doctorImage) as ImageProvider,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        DoctorRegisterCubit.get(context)
                                            .getDotorImage();
                                      },
                                      icon: const Icon(IconoirIcons.camera)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Doctors',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (state is DoctorProfileImagePickedSuccessState &&
                          state is! DoctorUploadImageSuccessState)
                        const LinearProgressIndicator(),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hintText: 'Full Name',
                        controller: cubit.nameController,
                        suffixIcon: IconoirIcons.user,
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: 'Email',
                        controller: cubit.emailController,
                        suffixIcon: IconoirIcons.mail,
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hintText: 'password',
                        controller: cubit.passwordController,
                        obscureText: RegisterCubit.get(context).isPassword,
                        onPressed: () {
                          RegisterCubit.get(context)
                              .changePasswordVisibilityState();
                        },
                        suffixIcon: RegisterCubit.get(context).suffixIcon,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: 'Confirm Password',
                        controller: cubit.rePasswordController,
                        obscureText: RegisterCubit.get(context).isRePassword,
                        onPressed: () {
                          RegisterCubit.get(context)
                              .changeRePasswordVisibilityState();
                        },
                        validator: (value) {
                          if (value != cubit.passwordController.text) {
                            return 'the passwords are not the same';
                          }
                          return null;
                        },
                        suffixIcon: RegisterCubit.get(context).reSuffixIcon,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: 'phone',
                        controller: cubit.phoneController,
                        suffixIcon: IconoirIcons.phone,
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: 'Bio',
                        controller: cubit.bioController,
                        suffixIcon: IconoirIcons.text,
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomAppButton(
                        text: "Doctor Sign Up",
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            cubit.registerDoctor(
                              email: cubit.emailController.text,
                              password: cubit.passwordController.text,
                              context: context,
                            );
                          }
                        },
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
