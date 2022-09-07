// ignore_for_file: avoid_print

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request/models/movie.dart';


class HttpService {
  final String apiKey = 'e16bd2b3e07c3fa480b577f73083dbe2';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      // ignore: avoid_print
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}