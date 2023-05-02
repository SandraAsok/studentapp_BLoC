import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentapp/db/model/data_model.dart';
import 'package:studentapp/screens/edit_screen.dart';
import 'package:studentapp/screens/home/widgets/detailed_list_student.dart';
import 'package:studentapp/student/student_bloc.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is StudentInitial) {
          context.read<StudentBloc>().add(FetchAllData());
        }
        if (state is DisplayAllStudents) {
          if (state.Students.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                // final data = state[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        FileImage(File(state.Students[index].image)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                            student: StudentModel(
                                name: state.Students[index].name,
                                age: state.Students[index].age,
                                domain: state.Students[index].domain,
                                Number: state.Students[index].Number,
                                image: state.Students[index].image)),
                      ),
                    );
                  },
                  title: Text(state.Students[index].name),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditScreen(
                                index: index,
                                data: StudentModel(
                                    name: state.Students[index].name,
                                    age: state.Students[index].age,
                                    domain: state.Students[index].domain,
                                    Number: state.Students[index].Number,
                                    image: state.Students[index].image),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<StudentBloc>()
                              .add(DeleteSpecificData(state.Students, index));
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: state.Students.length,
            );
          }
        }
        return const Center(
          child: Text('List is empty'),
        );
      },
    );
  }
}
