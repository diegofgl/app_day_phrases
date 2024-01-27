import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowMaterialGrid: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> frases = [
    'Se você não encher sua mente com a palavra de Deus, o inimigo vai te encher de medo, ansiedade, estresse, preocupação e tentação',
    'Quando for a hora certa, Eu o Senhor, farei acontecer.',
    'Vai dar certo, porque Deus não falha!',
    'Quando Deus der a você um novo começo, NÃO repita os mesmos erros.',
    'Seja paciente, aproveite a jornada, continue trabalhando e você verá os resultados que sempre sonhou.',
    'Deus sabe o que é melhor para você.',
    'Até aqui o Senhor nos ajudou!',
  ];

  String fraseAtual = "";

  @override
  void initState() {
    super.initState();
    gerarNovaFrase();
  }

  void gerarNovaFrase() {
    setState(() {
      final Random random = Random();
      fraseAtual = frases[random.nextInt(frases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "images/lua.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("images/lampada.png"),
                  Text(
                    fraseAtual,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      gerarNovaFrase();
                    },
                    child: Text(
                      "Nova Frase",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
