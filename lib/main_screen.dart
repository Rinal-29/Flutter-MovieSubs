import 'package:dicoding_submission/model/movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Apps"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        childAspectRatio: 1,
        scrollDirection: Axis.vertical,
        children: movieList(context).map<Widget>((movie) {
          return GridMovieItem(movie: movie);
        }).toList(),
      ),
    );
  }

  List<Movies> movieList(BuildContext context) {
    return [
      Movies(name: "What Men Want (2019)", imageAsset: "images/movie1.jpeg", desc: "A woman is transformed into her younger self at a point in her life when the pressures of adulthood become too much to bear.", rate: "7.3"),
      Movies(name: "Madea's Family Reunion (2006)", imageAsset: "images/movie2.jpeg", desc: "While planning her family reunion, a pistol-packing grandma must contend with the other dramas on her plate, including the runaway who has been placed under her care, and her love-troubled nieces.", rate: "6.8"),
      Movies(name: "Bumblebee (2018)", imageAsset: "images/movie3.jpeg", desc: "On the run in the year 1987, Bumblebee finds refuge in a junkyard in a small California beach town. On the cusp of turning 18 and trying to find her place in the world, Charlie Watson discovers Bumblebee, battle-scarred and broken.", rate: "7.9"),
      Movies(name: "The Greatest Showman (2017)", imageAsset: "images/movie4.jpeg", desc: "Celebrates the birth of show business and tells of a visionary who rose from nothing to create a spectacle that became a worldwide sensation.", rate: "8.6"),
      Movies(name: "Aquaman (2018)", imageAsset: "images/movie5.jpeg", desc: "Arthur Curry, the human-born heir to the underwater kingdom of Atlantis, goes on a quest to prevent a war between the worlds of ocean and land.", rate: "8.9"),
      Movies(name: "Ocean's Eight (2018)", imageAsset: "images/movie6.jpeg", desc: "Debbie Ocean gathers an all-female crew to attempt an impossible heist at New York City's yearly Met Gala.", rate: "6.7"),
      Movies(name: "Erased", imageAsset: "images/movie7.jpeg", desc: "29 year old Satoru Fujinuma is sent back in time 18 years to prevent the events leading to his mother's death, which began with a series of kidnappings in his 5th grade year.", rate: "6.9"),
      Movies(name: "The Predator (2018)", imageAsset: "images/movie8.jpeg", desc: "When a young boy accidentally triggers the universe's most lethal hunters' return to Earth, only a ragtag crew of ex-soldiers and a disgruntled scientist can prevent the end of the human race.", rate: "7.4"),
      Movies(name: "Harry Potter and The Deathly Hallows", imageAsset: "images/movie9.jpeg", desc: "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.", rate: "9.2"),
      Movies(name: "Fantastic Beasts: The Crimes of Grindelwald (2018)", imageAsset: "images/movie10.jpeg", desc: "The second installment of the Fantastic Beasts series featuring the adventures of Magizoologist Newt Scamander.", rate: "8.9"),
      Movies(name: "Mile 22", imageAsset: "images/movie11.jpeg", desc: "A small team of elite American intelligence officers, part of a top-secret tactical command unit, try to smuggle a mysterious police officer with sensitive information out of Indonesia.", rate: "8.2")
    ];
  }
}

class GridMovieItem extends StatelessWidget {

  GridMovieItem({
    Key key,
    @required this.movie
  }) : super(key: key);

  final Movies movie ;

  @override
  Widget build(BuildContext context) {

    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        movie.imageAsset,
        fit: BoxFit.fill
      ),
    );

    return InkWell(
      splashColor: Colors.white38,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(movie: movie);
        }));
      },
      child: Hero(
        tag: movie.name,
        child: GridTile(
          footer: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4))
            ),
            clipBehavior: Clip.antiAlias,
            child: GridTileBar(
              backgroundColor: Colors.black45,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
                child: Text(movie.name),
              ),
            ),
          ),
          child: image,
        ),
      ),
    );
  }
}

