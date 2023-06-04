import 'package:flutte_challange/12/core/constants.dart';
import 'package:flutte_challange/12/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'genre.dart';
import 'list_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen(
      {super.key, required this.nextPage, required this.previousPage});
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  //create a list from where we select the genre as we don't have any api right now in future will update this using api
  List<Genre> genres = const [
    Genre(name: 'Action'),
    Genre(name: 'Comedy'),
    Genre(name: 'Horror'),
    Genre(name: 'Anime'),
    Genre(name: 'Drama'),
    Genre(name: 'Family'),
    Genre(name: 'Romance')
  ];

  //define a method to toggle between the list
  void toggleSelected(Genre genre) {
    // try to emulate the immutable part
    // create a new list
    List<Genre> updatedGenre = [
      //loop through old genra

      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    //setState to update the list
    setState(() {
      genres = updatedGenre;
    });
  }

  @override
  Widget build(BuildContext context) {
    // let us define a theme
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(children: [
          Text(
            'Let\'s Select the Genre',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: kListItemSpacing),
                  itemBuilder: (context, index) {
                    final genre = genres[index];
                    return ListCard(
                      genre: genre,
                      onTap: () => toggleSelected(genre),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: kListItemSpacing);
                  },
                  itemCount: genres.length)),
          PrimaryButton(onPressed: widget.nextPage, text: 'Continue'),
          const SizedBox(
            height: kMediumSpacing,
          )
        ]),
      ),
    );
  }
}
