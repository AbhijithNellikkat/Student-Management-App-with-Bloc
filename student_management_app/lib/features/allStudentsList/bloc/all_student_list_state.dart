part of 'all_student_list_bloc.dart';

@immutable
abstract class AllStudentListState {}

class AllStudentListInitial extends AllStudentListState {}



class AllStudentListLoadingState extends AllStudentListState {}

class AllStudentListLoadedSuccessState extends AllStudentListState {
  final List<Map<String, dynamic>> studentsDatas ;

  AllStudentListLoadedSuccessState({required this.studentsDatas});
}

class AllStudentListErrorState extends AllStudentListState {}
