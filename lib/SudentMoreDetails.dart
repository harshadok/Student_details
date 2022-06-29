// ignore: file_names
import 'package:database_saple/EditPage.dart';
import 'package:database_saple/db/db_fuction/model.dart';
import 'package:database_saple/listStudent.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StudentMoreDetails extends StatelessWidget {
  StudentModel datas;
  int index;
  StudentMoreDetails({Key? key, required this.datas, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------------------APBAR------------------------------------------------------------------------//
      appBar: AppBar(
        centerTitle: true,
        title: const Text("STUDENT DETAILS"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => const ListStudentWidget()));
            }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => EditClass(datas: datas, index1: index)));
              },
              icon: const Icon(
                Icons.edit,
                size: 20,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Card(
            elevation: 20,
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(""),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "NAME : ${datas.name}",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "AGE : ${datas.age}",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "BATCH : ${datas.nam}",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ADVISOR : ${datas.adisor}",
                    style: const TextStyle(fontSize: 30),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
  // Future< File> imageFile;
  // ImagePicker(ImageSource gallery){

  //    imageFile= ImagePicker(gallery);
  // }

}
