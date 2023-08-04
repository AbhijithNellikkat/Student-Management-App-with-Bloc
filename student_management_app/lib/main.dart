import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/features/allStudentsList/bloc/all_student_list_bloc.dart';
import 'package:student_management_app/features/home/ui/pages/home_page.dart';
import 'features/addStudent/bloc/add_student_bloc.dart';
import 'features/home/bloc/home_bloc.dart';

void main() {
 runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeBloc()),
      BlocProvider(create: (context) => AddStudentBloc()),
      BlocProvider(create: (context) => AllStudentListBloc()),
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SafeArea(child: HomePage()),
    );
  }
}