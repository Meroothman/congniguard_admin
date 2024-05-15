import 'package:congniguard_admain/constant/const.dart';
import 'package:congniguard_admain/widgets/custom_app_button.dart';
import 'package:congniguard_admain/widgets/custom_text_form_field.dart';
import 'package:congniguard_admain/volunteer_register/volunteer_cubit/volunteer_register_state.dart';
import 'package:congniguard_admain/volunteer_register/volunteer_cubit/volunteer_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconoir_ttf/flutter_iconoir_ttf.dart';

class VolunteerRegister extends StatelessWidget {
  const VolunteerRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => VolunteerRegisterCubit()..getVolunteerData(),
      child: BlocConsumer<VolunteerRegisterCubit, VolunteerRegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = VolunteerRegisterCubit.get(context);
          var volunteerImage = cubit.volunteerImagePick;

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
                                    backgroundImage: volunteerImage == null
                                        ? const NetworkImage(
                                            'https://as2.ftcdn.net/v2/jpg/03/83/25/83/1000_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                                          )
                                        : FileImage(volunteerImage)
                                            as ImageProvider,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    child: IconButton(
                                        onPressed: () {
                                          VolunteerRegisterCubit.get(context)
                                              .getVolunteerImage();
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
                              'Volunteers',
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
                        if (state is VolunteerProfileImagePickedSuccessState &&
                            state is! VolunteerUploadImageSuccessState)
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
                          obscureText: cubit.isPassword,
                          onPressed: () {
                            cubit.changePasswordVisibilityState();
                          },
                          suffixIcon: cubit.suffixIcon,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          hintText: 'Confirm Password',
                          controller: cubit.rePasswordController,
                          obscureText: cubit.isRePassword,
                          onPressed: () {
                            cubit.changeRePasswordVisibilityState();
                          },
                          validator: (value) {
                            if (value != cubit.passwordController.text) {
                              return 'the passwords are not the same';
                            }
                            return null;
                          },
                          suffixIcon: cubit.reSuffixIcon,
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
                          text: "Volunteer Sign Up",
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              cubit.registerVolunteer(
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
      ),
    );
  }
}
