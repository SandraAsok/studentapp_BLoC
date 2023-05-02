import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/db/model/data_model.dart';
import 'package:studentapp/student/student_bloc.dart';

class AddStudentWidget extends StatefulWidget {
  const AddStudentWidget({super.key});

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {
  final _namecontroller = TextEditingController();

  final _agecontroller = TextEditingController();

  final _domaincontroller = TextEditingController();

  final _phonenumcontroller = TextEditingController();

  ValueNotifier _stringnofitier = ValueNotifier("assets/assets/person.jpeg");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: _stringnofitier,
                builder: (context, imageString, child) {
                  return CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    // backgroundImage: AssetImage(imageString),
                    radius: 100,
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: _stringnofitier,
                builder: (context, path, child) {
                  return IconButton(
                    onPressed: () async {
                      final PickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (PickedFile == null) {
                        return;
                      } else {
                        _stringnofitier.value = PickedFile.path;
                      }
                    },
                    icon: const Icon(Icons.camera),
                  );
                },
              ),
              TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.abc),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _namecontroller.clear();
                      },
                      icon: const Icon(Icons.close)),
                  border: const OutlineInputBorder(),
                  labelText: 'name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _agecontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.onetwothree),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _agecontroller.clear();
                      },
                      icon: const Icon(Icons.close)),
                  labelText: 'age',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _domaincontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.computer),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _domaincontroller.clear();
                      },
                      icon: const Icon(Icons.close)),
                  border: const OutlineInputBorder(),
                  labelText: 'Domain',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phonenumcontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _phonenumcontroller.clear();
                      },
                      icon: const Icon(Icons.close)),
                  border: const OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                style: const ButtonStyle(),
                onPressed: () {
                  // onAddStudentButtonClicked();
                  BlocProvider.of<StudentBloc>(context).add(AddData(
                      StudentModel(
                          name: _namecontroller.text,
                          age: _agecontroller.text,
                          domain: _domaincontroller.text,
                          Number: _phonenumcontroller.text,
                          image: _stringnofitier.value)));
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> onAddStudentButtonClicked() async {
  //   final _name = _namecontroller.text.trim();
  //   final _age = _agecontroller.text.trim();
  //   final _domain = _domaincontroller.text.trim();
  //   final _number = _phonenumcontroller.text.trim();
  //   final _image = path;

  //   if (_name.isEmpty || _age.isEmpty || _domain.isEmpty || _number.isEmpty) {
  //     return;
  //   } else {
  //     print('$_name $_age');
  //   }

  //   final _student = StudentModel(
  //       name: _name,
  //       age: _age,
  //       domain: _domain,
  //       Number: _number,
  //       image: _image!);
  //   addStudent(_student);
  // }

  // getImage() async {
  //   var path;
  //   final PickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (PickedFile == null) {
  //     return;
  //   } else {
  //     setState(() {
  //       this.path = PickedFile.path;
  //     });
  //   }
  // }
}
