import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuotePage(),
    );
  }
}

class QuotePage extends StatelessWidget {
  Future<Map<String, dynamic>> fetchQuote() async {
    String url = 'https://api.quotable.io/random';
    print("here");
    try {
      final response = await http.get(Uri.parse(url));
      print('here');
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print("error $e ");
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchQuote(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Failed to load quote: ${snapshot.error}');
            } else {
              String quote = snapshot.data!['content'];
              return Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Quote',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        quote,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            snapshot.data!["author"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
