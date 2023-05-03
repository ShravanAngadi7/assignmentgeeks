import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './menubar.dart';

class homm extends StatefulWidget {
  @override
  State<homm> createState() => _hommState();
}

class _hommState extends State<homm> {
  // String url = "https://hoblist.com/api/movieList";
  // Future PostData() async {
  //   http.Response response = await http.post(Uri.parse(url));
  // }

  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  Future<void> _getMovies() async {
    final response = await http.post(
      Uri.parse('https://hoblist.com/api/movieList'),
    );
    final data = jsonDecode(response.body);
    setState(() {
      movies = data['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(),
      backgroundColor: Colors.amberAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movies[index]['title']),
            subtitle: Text(movies[index]['language']),
          );
        },
      ),
    );
  }
}
