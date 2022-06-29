// ignore_for_file: file_names

import 'package:database_saple/SudentMoreDetails.dart';
import 'package:database_saple/db/db_fuction/model.dart';
import 'package:database_saple/db/db_fuction/db_fuction.dart';
import 'package:database_saple/homepage.dart';
import 'package:flutter/material.dart';

class ListStudentWidget extends StatefulWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  State<ListStudentWidget> createState() => _ListStudentWidgetState();
}

class _ListStudentWidgetState extends State<ListStudentWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return Scaffold(
            appBar: AppBar(
            title: const Text("Student List"),
            leading: IconButton(  
          icon:  const Icon(Icons.arrow_back),
          onPressed: (){

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const HomePage()));
          }
        ),
            centerTitle: true,),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              
              child: Card
              ( elevation:  10,
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = studentList[index];
              
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => StudentMoreDetails(
                                  datas: data,
                                  index: index,
                                )));
                      },
                      leading: const CircleAvatar(  
                        
                        radius: 40,
                      ),
                      title: Text(data.name),
                      subtitle: const Text("Click To See More Details"),
                      trailing: IconButton(
                        onPressed: () {
                          if (data.id != null) {
                            deletestudent(data.id!);
                          } else {
                            // ignore: avoid_print
                            print('unable to delet student is is null');
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: studentList.length,
                ),
              ),
            ),
          );
        });
  }
}
