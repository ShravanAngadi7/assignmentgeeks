import 'dart:convert';
import '../widget/menubar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<dynamic> _movies = [];
  @override
  void initState() {
    super.initState();
    _fetchMovieList();
  }
//   var headers = {
//   'Cookie': 'connect.sid=s%3AzKB9QYQlqZY48GW0pxylK5F6LavjGT0i.o%2FDr3pMz%2Fov7Y3rrf8IGyrLrWAITsGiTFlbH8kGh%2FBQ'
// };
// var request = http.Request('POST', Uri.parse('https://hoblist.com/api/movieList'));
// request.headers.addAll(headers);
// http.StreamedResponse response = await request.send();
// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

  Future<void> _fetchMovieList() async {
    final url = Uri.parse('https://hoblist.com/api/movieList');
    final response = await http.post(
      url,
      body: {'category': 'movies', 'language': 'kannada', 'genre': 'all'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _movies = data['result'];
      });
    } else {
      throw Exception('Failed to fetch movie list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      drawer: SideMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Movie List'),
      ),
      body: _movies.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return ListTile(
                  leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(movie['image_url'].toString())),
                  title: Text(movie['movie_name'].toString()),
                  subtitle: Text(movie['language'].toString()),
                  trailing: Text(movie['rating'].toString()),
                );
              },
            ),
    );
  }
}
//   void fetchUsers() async {
//     const url = 'https://hoblist.com/favourites/list/movies';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     setState(() {
//       users = json['result'];
//     });
//     print('complted');
// }

class movie {
  String? image_url;
  String? movie_name;
  String? language;
  int? rating;

  movie({
    required this.image_url,
    required this.movie_name,
    required this.language,
    required this.rating,
  });
}
