part of 'add_student_bloc.dart';

@immutable
abstract class AddStudentState {}

class AddStudentInitial extends AddStudentState {}

class AddStudentSuccessSate extends AddStudentState {}

class AddStudentErrorState extends AddStudentState {}
