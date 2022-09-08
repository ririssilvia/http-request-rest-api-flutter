import 'package:flutter/material.dart';
import 'package:http_request/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    String releaseDate;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath; //didapat dari models movie
    } else {
      path = 'https://www.freeiconspng.com/uploads/no-image-icon-11.PNG';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text(
          'Movie Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                child: Container(
                  height: 450,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        path,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              (movie.title),
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          movie.voteAverage.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(16),
            ),
            Text(
              movie.overview,
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
