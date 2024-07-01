import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imagens/imagens.dart';
import 'package:http/http.dart' as http;

Future<Imagens> buscaImagens(int numero) async {
  final resposta = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$numero'));

  if (resposta.statusCode == 200) {
    // 200 é OK
    return Imagens.fromJson(jsonDecode(resposta.body) as Map<String, dynamic>);
  } else {
    throw Exception('Falha ao carregar imagem.');
  }
}

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  late Future<Imagens> futuroImagens;
  int contador = 1;
  void novoImagens() {
    setState(() {
      contador++;
      futuroImagens = buscaImagens(contador);
    });
  }

  @override
  void initState() {
    super.initState();
    futuroImagens = buscaImagens(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagens'),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<Imagens>(
              future: futuroImagens,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                      width: 100, child: Image.network(snapshot.data!.url));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
