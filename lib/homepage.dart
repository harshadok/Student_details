import 'package:database_saple/addStudentWidget.dart';
// ignore: unused_import
import 'package:database_saple/db/db_fuction/db_fuction.dart';
import 'package:database_saple/listStudent.dart';
import 'package:database_saple/serch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Registraion From',),
        actions: [
          IconButton(onPressed: (){
                 showSearch(context: context, delegate: SerchClass());

          }, icon: const Icon(Icons.search))
        ],

      ),
      body: SafeArea(child: Column (
        

        
         mainAxisAlignment: MainAxisAlignment.center,
        children:  [       




        

           SizedBox(
            
            width: 500,
            child: ElevatedButton(onPressed: (){
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const AddSudentWidget() ));
            }, child: const Text("Add Student")),
             
           ),
           SizedBox(
            
            width: 500,
            child: ElevatedButton(onPressed: (){
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ListStudentWidget() ));
            }, child: const Text("Show StudentList")),
             
           ),
        
      ],)),
      
    );
  }
}