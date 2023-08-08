part of 'all_student_list_bloc.dart';

class AllStudentListState {}

class AllStudentListActionState extends AllStudentListState {}

class AllStudentListInitial extends AllStudentListState {}

class AllStudentListLoadingState extends AllStudentListState {}

class AllStudentListLoadedSuccessState extends AllStudentListState {
  final List<Map<String, dynamic>> studentsDatas;

  AllStudentListLoadedSuccessState({required this.studentsDatas});
}

class AllStudentListErrorState extends AllStudentListState {}

class AllStudentListDeleteSuccessActionState
    extends AllStudentListActionState {}

class AllStudentListNavigateToStudentsDetailsPageActionState
    extends AllStudentListActionState {
  final int index;
  AllStudentListNavigateToStudentsDetailsPageActionState({required this.index});
}

class AllStudentListNavigarteToUpdatePageState
    extends AllStudentListActionState {
  final int index;

  AllStudentListNavigarteToUpdatePageState({required this.index});
}
