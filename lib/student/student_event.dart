part of 'student_bloc.dart';

@immutable
abstract class StudentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllData extends StudentEvent {
  FetchAllData();

  @override
  List<Object> get props => [];
}

class AddData extends StudentEvent {
  final StudentModel studentdata;

  AddData(this.studentdata);
  @override
  List<Object> get props => [studentdata];
}

class FetchSpecificData extends StudentEvent {
  FetchSpecificData();
  @override
  List<Object> get props => [];
}

class UpdateSpecificData extends StudentEvent {
  final StudentModel studentModel;
  final int index;

  UpdateSpecificData(this.studentModel, this.index);
  // final String name;

  // final String age;

  // final String domain;

  // final String Number;

  // final String image;

  // UpdateSpecificData(this.studentModel, this.name, this.age, this.domain,
  //     this.Number, this.image);

  @override
  List<Object> get props => [studentModel, index];
}

class DeleteSpecificData extends StudentEvent {
  final List<StudentModel> studentModel;
  final int index;
  DeleteSpecificData(this.studentModel, this.index);

  @override
  List<Object> get props => [studentModel];
}
