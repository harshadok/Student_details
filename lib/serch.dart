import 'package:database_saple/SudentMoreDetails.dart';
import 'package:database_saple/db/db_fuction/model.dart';
import 'package:flutter/material.dart';

import 'db/db_fuction/db_fuction.dart';

class SerchClass extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (query.toLowerCase() == data.name.toLowerCase()) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        (MaterialPageRoute(builder: (ctx) {
                          return StudentMoreDetails(datas: data, index: index);
                        })),
                        (route) => true);
                  },
                  title: Text(
                    data.name,
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
          separatorBuilder: (ctx, index) {
            return Container();
          },
          itemCount: studentList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (query == data.name[0].toLowerCase() ||
                query == data.name[0].toUpperCase()) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        (MaterialPageRoute(builder: (ctx) {
                          return StudentMoreDetails(datas: data, index: index);
                        })),
                        (route) => true);
                  },
                  title: Text(
                    data.name,
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
          separatorBuilder: (ctx, index) {
            return Container();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
