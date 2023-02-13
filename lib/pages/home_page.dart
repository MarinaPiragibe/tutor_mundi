import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _avaliacao = 0;
  int _ratingBarMode = 0; //1

  Widget _ratingBar(int mode) {
    return RatingBar(
      initialRating: 0,
      allowHalfRating: false,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: Image.asset('assets/images/estrela_cheia.png'),
        half: Image.asset('assets/images/estrela_cheia.png'),
        empty: Image.asset('assets/images/estrela_vazia.png'),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 4),
      onRatingUpdate: (avaliacao) {
        setState(() {
          _avaliacao = avaliacao;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: Column(children: [
                  Image.asset(
                    "assets/images/livro.png",
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                  Text(
                    'Como foi a ajuda do tutor?',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LondrinaSolid'),
                    textAlign: TextAlign.center,
                  ),
                  _ratingBar(_ratingBarMode),
                  Text(
                    "Avaliação: $_avaliacao",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FloatingActionButton.extended(
                    label: Text('Confirmar'),
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    onPressed: () => {},
                  ),
                ]))));
  }
}
