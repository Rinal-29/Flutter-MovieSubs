import 'package:dicoding_submission/model/movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Movies movie;
  DetailScreen({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              Hero(
                tag: movie.name,
                child: Material(
                  child: InkWell(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(movie.imageAsset)),
                        )),
                  ),
                ),
              ),
              SafeArea(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ),
            ]),
            SectionTitle(name: movie.name),
            SectionIcon(rate: movie.rate),
            SectionDescription(desc: movie.desc)
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {

  SectionTitle({this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, left: 8.0),
      child: Text(
        name,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SectionIcon extends StatelessWidget {

  SectionIcon({this.rate});
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.movie),
              SizedBox(height: 16.0),
              Text("Movies")
            ],
          ),

          Column(
            children: [
              Icon(Icons.star_sharp, color: Colors.yellow),
              SizedBox(height: 16.0),
              Text("Rate $rate", style: TextStyle(color: Colors.yellow),)
            ],
          ),

          Column(
            children: [
              IconButtonFavorite(),
              Text("Favorite", style: TextStyle(color: Colors.red))
            ],
          )
        ],
      ),
    );
  }
}

class SectionDescription extends StatelessWidget {

  SectionDescription({this.desc});
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        desc,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}


class IconButtonFavorite extends StatefulWidget {
  @override
  _IconButtonFavoriteState createState() => _IconButtonFavoriteState();
}

class _IconButtonFavoriteState extends State<IconButtonFavorite> {

  bool _isFavorite = false;

  void favMovie() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          _isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          favMovie();
        },
    );
  }
}


