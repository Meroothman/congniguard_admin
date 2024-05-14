import 'package:congniguard_admain/doctor_register/doctor_register.dart';
import 'package:congniguard_admain/mentor_register/mentor_register.dart';
import 'package:congniguard_admain/views/widgets/app_images.dart';
import 'package:congniguard_admain/views/widgets/custom_app_button.dart';
import 'package:congniguard_admain/views/widgets/function_nav.dart';
import 'package:congniguard_admain/volunteer_register/volunteer_register.dart';
import 'package:flutter/material.dart';

class AdmainPage extends StatelessWidget {
  const AdmainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Card(
              elevation: 10,
              child: Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Admin Page',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 200, 9, 234),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
            const Image(
              image: AssetImage(Assets.imagesLogo),
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 70),
            CustomAppButton(
              text: "Add Mentor",
              onPressed: () {
                navigatTo(context, const MentorRegister());
              },
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            CustomAppButton(
              text: "Add Doctor",
              onPressed: () {
                navigatTo(context, const DocotrRegister());
              },
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            CustomAppButton(
              text: " Add Volunteer",
              onPressed: () {
                navigatTo(context, const VolunteerRegister());
              },
              width: double.infinity,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
