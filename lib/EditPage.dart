// ignore_for_file: file_names

import 'package:database_saple/db/db_fuction/db_fuction.dart';
import 'package:database_saple/db/db_fuction/model.dart';
import 'package:database_saple/listStudent.dart';
import 'package:flutter/material.dart';


class EditClass extends StatelessWidget {
  StudentModel datas;
  int index1;

  EditClass({Key? key, required this.datas, required this.index1})
      : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _batchController = TextEditingController();
  final _advisorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = datas.name;
    _ageController.text = datas.age;
    _batchController.text = datas.nam;
    _advisorController.text = datas.adisor;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const ListStudentWidget()), (route) => false);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        
          child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'EDIT YOUR  DETAILS',
                style: TextStyle(
                    color: Color.fromARGB(255, 8, 8, 8),
                    fontSize: 20,
                    fontFamily: "BebasNeue-Regular"),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
       
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(),
          ),
         
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _ageController,
            decoration: const InputDecoration(),
          ),
         
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _batchController,
            decoration: const InputDecoration(),
          ),
          TextFormField(
            controller: _advisorController,
            decoration: const InputDecoration(),
          ),

          ElevatedButton.icon(
              onPressed: () {
                
              
               submit(context);

               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const ListStudentWidget()), (route) => false);
                
              },
              icon: const Icon(Icons.add),
              label: const Text('ADD CHANGES')),
          const SizedBox(
            height: 10.0,
          ),
        ],
      )),
    );
  }

  void submit(BuildContext context) async {
    final _name = _nameController.text;
    final _age = _ageController.text;
    final _batch = _batchController.text;
    final _advisor = _advisorController.text;
    final ediStudentObj =
        StudentModel(name: _name, age: _age, nam: _batch, adisor: _advisor, image:'');
     await editedItems(index1, ediStudentObj);
  }
}
