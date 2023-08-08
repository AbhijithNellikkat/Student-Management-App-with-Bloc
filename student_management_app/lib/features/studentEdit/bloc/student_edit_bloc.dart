import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'student_edit_event.dart';
part 'student_edit_state.dart';

class StudentEditBloc extends Bloc<StudentEditEvent, StudentEditState> {
  StudentEditBloc() : super(StudentEditInitial()) {}
}
