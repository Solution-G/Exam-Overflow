import 'dart:collection';
import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:http/http.dart' as http;

class MyMaterial extends StatefulWidget {
  MyMaterial({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyMaterialView();
  }
}

// ignore: must_be_immutable
class MyMaterialView extends State<MyMaterial> {
  List<dynamic> materials = [];
  Map<int, bool> downloading = {};

  @override
  void initState() {
    super.initState();
    loadMaterials();
  }

  Future<List<dynamic>> loadMaterials() async {
    var result = await http.post(Uri.parse(Database.load_material),
        body: {'grade': '12', 'subject': 'math'});
    if (result.statusCode == 200) {
      materials = jsonDecode(result.body);
      return materials;
    } else {}
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 193, 72, 95)),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            // This will set the scaffhold background transparent so that the background setted by the container will be visible
            backgroundColor: Colors.transparent,
            // to scroll for available exams Listed
            body: Column(
              children: [
                TopTitle(title: "Material"),
                Expanded(
                  child: FutureBuilder<List<dynamic>>(
                      future: loadMaterials(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text(
                            'Error ocured ${snapshot.error}',
                            style: TextStyle(color: Colors.red),
                          ));
                        } else {
                          return ListView.builder(
                              itemCount: materials.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: ListTile(
                                      leading: Image(
                                          image: AssetImage('assets/book.png')),
                                      title: Text(
                                        materials[index]['subject'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 193, 72, 95)),
                                      ),
                                      subtitle: Text(materials[index]['grade']),
                                      trailing: downloading[index] ?? false ? CircularProgressIndicator() : ElevatedButton(
                                        onPressed: () {
                                          FileDownloader.downloadFile(
                                              url: materials[index]['link'],
                                              onProgress: (value, progress) {
                                                setState(() {
                                                  downloading[index] = true;
                                                });
                                              },
                                              onDownloadCompleted:
                                                  (val) {
                                                setState(() {
                                                  downloading[index] = false;
                                                });
                                              });
                                        },
                                        child: Icon(Icons.download),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
