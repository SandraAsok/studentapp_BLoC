import 'package:hive/hive.dart';
import 'package:studentapp/db/model/data_model.dart';

class StudentBox {
  static Box<StudentModel> getStudentData() =>
      Hive.box<StudentModel>('student_db');
}
