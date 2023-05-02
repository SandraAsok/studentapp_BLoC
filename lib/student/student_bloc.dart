// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:studentapp/db/model/boxes.dart';
import 'package:studentapp/db/model/data_model.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
    on<FetchAllData>((event, emit) {
      try {
        final studnetdata = StudentBox.getStudentData();
        List<StudentModel> students = studnetdata.values.toList();
        emit(DisplayAllStudents(students));
        // add(FetchAllData());
        // print(students.length);
      } catch (e) {
        log(e.toString());
      }
    });
    on<AddData>((event, emit) {
      try {
        final studentbox = StudentBox.getStudentData();
        studentbox.add(event.studentdata);
        add(FetchAllData());
      } catch (e) {
        log(e.toString());
      }
    });
    on<UpdateSpecificData>((event, emit) {
      try {
        // final studentbox = StudentBox.getStudentData();
        // studentbox.put(event.studentModel.key, event.studentModel);
        final studnetdata = StudentBox.getStudentData();
        studnetdata.putAt(event.index, event.studentModel);

        add(FetchAllData());
      } catch (e) {
        log(e.toString());
      }
    });
    on<DeleteSpecificData>((event, emit) {
      final studnetdata = StudentBox.getStudentData();

      try {
        studnetdata.deleteAt(event.index);
        add(FetchAllData());
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
