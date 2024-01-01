import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/features/allStudentsList/bloc/all_student_list_bloc.dart';
import 'package:student_management_app/features/studentEdit/bloc/student_edit_bloc.dart';
import 'package:student_management_app/firebase_options.dart';
import 'package:student_management_app/widgets/frist_page.dart';
import 'package:student_management_app/widgets/slpashScreen.dart';

import 'features/addStudent/bloc/add_student_bloc.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/studentDetails/bloc/student_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeBloc()),
      BlocProvider(create: (context) => AddStudentBloc()),
      BlocProvider(create: (context) => AllStudentListBloc()),
      BlocProvider(create: (context) => StudentDetailsBloc()),
      BlocProvider(create: (context) => StudentEditBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management App',
      debugShowCheckedModeBanner: false,
      
      home: const SafeArea(child: SplashScreen()),
    );
  }
}
