import 'package:flutter/material.dart';
import 'package:http_request/pages/movie_detail.dart';
import 'package:http_request/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  late List movies;
  late HttpService service;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies()) as List;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
//       body: ListView.builder(
//           itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
//           itemBuilder: (context, int position) {
//             return Card(
//               color: Colors.white,
//               elevation: 2.0,
//               child: ListTile(
//                 leading: Image.network(imgPath + movies[position].posterPath),
//                 title: Text(
//                   movies[position].title,
//                   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                 ),
//                subtitle: Row(children: [
//                     const Icon(
//                       Icons.star,
//                       color: Colors.yellow,
//                     ),
//                     Text(movies[position].voteAverage.toString())
//                   ]),
//                 onTap: () {
//                 MaterialPageRoute route = MaterialPageRoute(
//                   builder: (_) => MovieDetail(movies[position]),
//                 );
//                 Navigator.push(context, route);
//               },
//               ),
//             );
//           }),
//     );
//   }
// }
      body: GridView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          padding: const EdgeInsets.all(20),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (context, int position) {
            return GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network(
                  imgPath + movies[position].posterPath,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ),
            );
          }),
    );
  }
}
