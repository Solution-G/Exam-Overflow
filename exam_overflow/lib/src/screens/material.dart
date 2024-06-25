import 'dart:collection';
import 'dart:convert';

import 'package:exam_overflow/src/database/database_connection.dart';
import 'package:exam_overflow/src/screens/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
  String download_dir = '/storage/emulated/0/Downloads/';

  @override
  void initState() {
    super.initState();
    loadMaterials();
  }

  Future<bool> permissionRequest(Permission permission) async {
    try {
      final result = await permission.request();

      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>> loadMaterials() async {
    try {
      var result = await http.post(Uri.parse(Database.load_material), body: {});
      if (result.statusCode == 200) {
        print(result.body);
        materials = jsonDecode(result.body);
        return materials;
      } else {}
    } catch (e) {
      return [];
    }
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
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 193, 72, 95),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
              ),
            ),
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
                                          color:
                                              Color.fromARGB(255, 193, 72, 95)),
                                    ),
                                    subtitle: Text(materials[index]['grade']),
                                    trailing: downloading[index] ?? false
                                        ? CircularProgressIndicator()
                                        : ElevatedButton(
                                            onPressed: () async {
                                              if (await permissionRequest(
                                                  Permission.storage)) {
                                                setState(() {
                                                  downloading[index] = true;

                                                  FileDownloader.downloadFile(
                                                      url: materials[index]
                                                          ['link'],
                                                      onProgress:
                                                          (value, progress) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    "Donwload has started")));
                                                      },
                                                      onDownloadCompleted:
                                                          (val) {
                                                        setState(() {
                                                          downloading[index] =
                                                              false;
                                                          Fluttertoast.showToast(
                                                              msg: "Completed");
                                                        });
                                                      });
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Permission is required');
                                              }
                                            },
                                            child: Icon(Icons.download),
                                          ),
                                  ),
                                ),
                              );
                            },
                          );
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
