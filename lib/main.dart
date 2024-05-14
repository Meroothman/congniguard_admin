import 'package:congniguard_admain/bloc_observer.dart';
import 'package:congniguard_admain/firebase_options.dart';
import 'package:congniguard_admain/doctor_register/doctor_cubit/doctor_register_cubit.dart';
import 'package:congniguard_admain/mentor_register/mentor_cubit/mentor_register_cubit.dart';
import 'package:congniguard_admain/views/admain_page.dart';
import 'package:congniguard_admain/volunteer_register/volunteer_cubit/volunteer_register_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DoctorRegisterCubit>(
            create: (context) => DoctorRegisterCubit()),
        BlocProvider<MentorRegisterCubit>(
            create: (context) => MentorRegisterCubit()),
        BlocProvider<VolunteerRegisterCubit>(
            create: (context) => VolunteerRegisterCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const AdmainPage(),
      ),
    );
  }
}
