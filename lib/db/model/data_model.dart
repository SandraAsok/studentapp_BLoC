import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String age;
  @HiveField(3)
  late final String domain;
  @HiveField(4)
  late final String Number;
  @HiveField(5)
  late final String image;

  StudentModel(
      {required this.name,
      required this.age,
      this.id,
      required this.domain,
      required this.Number,
      required this.image});
}
