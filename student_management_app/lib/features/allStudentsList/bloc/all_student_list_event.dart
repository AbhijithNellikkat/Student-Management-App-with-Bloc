part of 'all_student_list_bloc.dart';

class AllStudentListEvent {}

class AllStudentListInitialEvent extends AllStudentListEvent {}

class AllStudentListEditStudentButtonClickedEvent extends AllStudentListEvent {}

class AllStudentListDeleteEvent extends AllStudentListEvent {
  final int id;
  AllStudentListDeleteEvent({required this.id});
}

class AllStudentListNavigateToStudentDetailsPage extends AllStudentListEvent {
  final int index;
  AllStudentListNavigateToStudentDetailsPage({required this.index});
}

class AllStudentListNavigateToUpdatePageEvent extends AllStudentListEvent {
  final int index;

  AllStudentListNavigateToUpdatePageEvent({required this.index});
}
