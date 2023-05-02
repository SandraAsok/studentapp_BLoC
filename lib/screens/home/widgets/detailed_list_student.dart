import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/db/model/data_model.dart';

class Details extends StatefulWidget {
  StudentModel? student;

  Details({super.key, this.student});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // String? image;
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);
    this.image = imageTemporary;

    // image = imagetemporary;
  }

  @override
  Widget build(BuildContext context) {
    // StudentDetails(studentdata);
    print(widget.student);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Details'),
        ),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Container(
                  //   child: Text('Name: ${widget.data.name}'),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     color: Colors.white10
                  // ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: FileImage(File(widget.student!.image)),
                      radius: 100,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                        style: const TextStyle(
                          fontSize: 23,
                        ),
                        "Name : ${widget.student!.name}"),
                    // title: Text('${passValue.name}'),
                  ),
                  ListTile(
                    leading: Text(
                        style: const TextStyle(fontSize: 23),
                        "Age : ${widget.student!.age}"),
                  ),
                  ListTile(
                    leading: Text(
                        style: const TextStyle(
                          fontSize: 23,
                        ),
                        "Domain : ${widget.student!.domain}"),
                  ),
                  ListTile(
                    leading: Text(
                        style: const TextStyle(
                          fontSize: 23,
                        ),
                        "Phone Number : ${widget.student!.Number}"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
