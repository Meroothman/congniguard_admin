import 'package:congniguard_admain/register/register_cubit/volunteer_register_cubit.dart';
import 'package:congniguard_admain/register/register_cubit/register_state.dart';
import 'package:congniguard_admain/views/widgets/custom_app_button.dart';
import 'package:congniguard_admain/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconoir_ttf/flutter_iconoir_ttf.dart';

class VoleunteerRegister extends StatelessWidget {
  const VoleunteerRegister(
      {super.key, required this.addingtype, required this.collectionName});

  final String addingtype;
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
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
                      Card(
                        elevation: 10,
                        child: Container(
                          width: 400,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              addingtype,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 200, 9, 234),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 74,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: const CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?w=996&t=st=1715699992~exp=1715700592~hmac=e7dbdcb1d90c92dbf1c5975a93a049a92ef6c11e101e48288dab3a4bda94b28f',
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(IconoirIcons.camera)),
                            ),
                          ),
                        ],
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'age',
                              controller: cubit.ageController,
                              isPassword: false,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'BirthDay',
                              controller: cubit.birthDayController,
                              isPassword: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomAppButton(
                        text: "Sign Up",
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            // cubit.registermentor(
                            //   email: cubit.emailController.text,
                            //   password: cubit.passwordController.text,
                            //   context: context,
                            // );
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
