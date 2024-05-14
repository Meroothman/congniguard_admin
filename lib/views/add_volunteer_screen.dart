import 'package:congniguard_admain/register/volunteer_register.dart';
import 'package:flutter/material.dart';

class AddVolunteer extends StatelessWidget {
  const AddVolunteer({super.key});

  @override
  Widget build(BuildContext context) {
    return const VoleunteerRegister(
      addingtype: 'Volunteer',
      collectionName: 'volunteer',
    );
  }
}
