import 'package:flutter/material.dart';

void main() => runApp(VideotecaApp());

class VideotecaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videoteca',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MovieListPage(),
    );
  }
}

class Movie {
  final String title;
  final String description;
  final String image;

  Movie({required this.title, required this.description, required this.image});
}

class MovieListPage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'Matrix',
      description: 'Película de ciencia ficción sobre mundos simulados.',
      image: 'https://via.placeholder.com/150', // Simula imagen
    ),
    Movie(
      title: 'El Padrino',
      description: 'Clásico del cine sobre la mafia italiana.',
      image: 'https://via.placeholder.com/150',
    ),
    Movie(
      title: 'Interestelar',
      description: 'Exploración espacial y los límites del tiempo.',
      image: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Videoteca')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            leading: Image.network(movie.image),
            title: Text(movie.title),
            subtitle: Text(movie.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailPage(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(movie.image),
            SizedBox(height: 16),
            Text(movie.description, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
