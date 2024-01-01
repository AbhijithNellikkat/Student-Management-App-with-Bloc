import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app/database/database.dart';
part 'student_edit_event.dart';
part 'student_edit_state.dart';

class StudentEditBloc extends Bloc<StudentEditEvent, StudentEditState> {
  StudentEditBloc() : super(StudentEditInitial()) {
    on<UpdateEvent>(updateEvent);
  }

  FutureOr<void> updateEvent(
      UpdateEvent event, Emitter<StudentEditState> emit) async {
    await StudentDatabase.updateData(event.id, event.data);
    emit(UpdateState());
  }
}
