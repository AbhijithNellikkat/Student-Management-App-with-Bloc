part of 'student_details_bloc.dart';

class StudentDetailsState {}

class StudentDetailsInitial extends StudentDetailsState {}

class StudentDetailsActionState extends StudentDetailsState {}

class StudentDetailsLoadingState extends StudentDetailsState {}

class StudentDetailsLoadedSuccessState extends StudentDetailsState {
  final List<Map<String, dynamic>> students;

  StudentDetailsLoadedSuccessState({required this.students});
}

class StudentDetailsErrorState extends StudentDetailsState {}

