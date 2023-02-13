import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode myfocus = FocusNode();
  String starState_image = 'assets/images/estrela_vazia.png';

  void _atualizaEstrela(String value) {
    if (value == 'assets/images/estrela_vazia.png') {
      setState(() {
        starState_image = 'assets/images/estrela_cheia.png';
      });
    } else {
      setState(() {
        starState_image = 'assets/images/estrela_vazia.png';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: Column(children: [
                  Image.asset("assets/images/livro.png", fit: BoxFit.fill),
                  Text('Como foi a ajuda do tutor?',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LondrinaSolid')),
                  IconButton(
                    splashRadius: 34,
                    icon: Image.asset(starState_image),
                    iconSize: 50,
                    onPressed: () => _atualizaEstrela(starState_image),
                    focusNode: myfocus,
                  )
                ]))));
  }
}
