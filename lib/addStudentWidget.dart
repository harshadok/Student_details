


import 'dart:convert';
import 'dart:io';
import 'package:database_saple/db/db_fuction/model.dart';
import 'package:database_saple/db/db_fuction/db_fuction.dart';
import 'package:database_saple/homepage.dart';
import 'package:database_saple/listStudent.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AddSudentWidget extends StatefulWidget {

  const AddSudentWidget({Key? key}) : super(key: key);

  @override
  State<AddSudentWidget> createState() => _AddSudentWidgetState();
}

class _AddSudentWidgetState extends State<AddSudentWidget> {
    final fromKey =GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _namController = TextEditingController();

  final _advsorController = TextEditingController();
  
  String getImage = '';

   String imageToString = '';

  imagePicker() async{
   final imagefromGalary =   await imagePicker().getImage(source : ImageSource.gallery);
   final bytes = File(imagefromGalary!.path).readAsBytesSync();

     imageToString = base64Encode(bytes);

     setState(() {
       getImage=imageToString;
     });

    
  }


  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Students"),
        leading: IconButton(  
          icon:  const Icon(Icons.arrow_back),
          onPressed: (){

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const HomePage()));
          }
        ),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: Form(
          key: fromKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                GestureDetector(
                  onTap :() => imagePicker(),

                 child:  CircleAvatar(
                    radius: 40,
                            
                    backgroundImage: MemoryImage(const Base64Decoder().convert(getImage)),
                    
                  ),
                ),
                
                
                TextFormField(
                  validator: (value){
    
                    if( value== null || value.isEmpty){
    
                      return "File The From";
                    }else{
                      
    
                      return null;
                    }
                  },
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                TextFormField(
                   validator: (value){
    
                    if( value== null || value.isEmpty){
    
                      return "File The From";
                    }else{
                      
    
                      return null;
                    }
                  },
                  
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                  ),
                ),
                
                TextFormField(
                   validator: (value){
    
                    if( value== null || value.isEmpty){
    
                      return "File The From";
                    }else{
                      
    
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: _namController,
                  decoration: const InputDecoration(
                    hintText: 'Batch',
                  ),
                ),
                TextFormField(
                   validator: (value){
    
                    if( value== null || value.isEmpty){
    
                      return "File The From";
                    }else{
                      
    
                      return null;
                    }
                  },
                  controller: _advsorController,
                  decoration: const InputDecoration(
                    hintText: 'AdvisorName',
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      fromKey.currentState?.validate();
                      onAddStudentButton(contex);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Student ')),

                    ElevatedButton.icon(
                    onPressed: () {
             
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ListStudentWidget()));
                    },
                    icon: const Icon(Icons.show_chart),
                    label: const Text('Go To List ')),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

   
  Future<void> onAddStudentButton(BuildContext contex) async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _nam = _namController.text.trim();
    final _advsor = _advsorController.text.trim();
    
    
    final _student = StudentModel(
        name: _name, age: _age, nam: _nam, adisor: _advsor, id: null, image: getImage );

    if (_name.isEmpty || _age.isEmpty || _nam.isEmpty || _advsor.isEmpty) {
      showDialog(
          context: contex,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
              title: const Text(
                "Fill The Full Details",
                style: TextStyle(
                    color: Colors.red, fontSize: 15),
              ),
            );
          });
    } else {
      ScaffoldMessenger.of(contex).showSnackBar(SnackBar(
          backgroundColor: Colors.amber[300],
          content: const Text("Registration Completed")));
      addStudent(_student);
    }
    
    
  }
}
