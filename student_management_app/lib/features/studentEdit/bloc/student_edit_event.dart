part of 'student_edit_bloc.dart';

class StudentEditEvent {}

class StudentEditInitialEvent extends StudentEditEvent {}

class UpdateEvent extends StudentEditEvent {
  final int id;
  final Map<String, dynamic> data;

  UpdateEvent({required this.id, required this.data});
}
