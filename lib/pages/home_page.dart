import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _avaliacao = 0;
  final int _ratingBarMode = 0; //1

  bool _isButtonDisabled = true; // Controla a ativação do botão de confirmar
  Color _confirmButton_color = Colors.grey;

  // Método de criação das estrelas de avaliação com o ratingBar Widget
  Widget _ratingBar(int mode) {
    return RatingBar(
      initialRating: 0,
      allowHalfRating: false,
      itemCount: 5, // Admite o valor de 5 estrelas

      ratingWidget: RatingWidget(
        full: Image.asset('assets/images/estrela_cheia.png'),
        half: Image.asset('assets/images/estrela_cheia.png'),
        empty: Image.asset('assets/images/estrela_vazia.png'),
      ),

      itemPadding: const EdgeInsets.symmetric(horizontal: 4),

      // Função responsável por atualizar o valor da avaliação de acordo com a estrela selecionada
      onRatingUpdate: (avaliacao) {
        setState(() {
          _avaliacao = avaliacao;
        });
        if (_avaliacao == 0) {
          // Desabilita o botão de confirmar caso nenhuma estrela tenha sido selecionada
          _isButtonDisabled = true;
          _confirmButton_color = Colors.grey;
        } else {
          // Caso contrário, habilita o botão de confirmar
          _isButtonDisabled = false;
          _confirmButton_color = Colors.blue;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height: (MediaQuery.of(context).size.height),
                width: (MediaQuery.of(context).size.width),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                child: Column(children: [
                  Image.asset(
                    "assets/images/livro.png",
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                  const Text(
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Spacer(),
                      const TextButton(
                        onPressed: null,
                        child: Text(
                          'PULAR',
                          style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 143,
                        height: 40,
                        child: FloatingActionButton.extended(
                          label: const Text('CONFIRMAR',
                              style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.bold)),
                          backgroundColor: _confirmButton_color,
                          onPressed: _isButtonDisabled
                              ? null
                              : () {
                                  print(_avaliacao);
                                },
                        ),
                      ),
                    ],
                  )),
                ]))));
  }
}
