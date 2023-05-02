part of 'student_bloc.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {
  StudentInitial();

  @override
  List<Object> get props => [];
}

class DisplayAllStudents extends StudentState {
  final List<StudentModel> Students;

  DisplayAllStudents(this.Students);
  @override
  List<Object> get props => [Students];
}

class DisplaySpecificData extends StudentState {
  final StudentModel student;

  DisplaySpecificData(this.student);
  @override
  List<Object> get props => [student];
}
