import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/search/search_delegate.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()))
        ],
        title: const Center(
          child: Text('Peliculas en Cines', style: TextStyle(fontSize: 20)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Listado de Peliculas
            CardSwiper(movies: moviesProvider.onDisplayMovie),

            //Slider de Peliculas en
            MovieSlider(
                populars: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies())
          ],
        ),
      ),
    );
  }
}
