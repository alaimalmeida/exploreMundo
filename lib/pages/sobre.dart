import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sobre a Empresa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Sobre(),
    );
  }
}

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nós'),
        backgroundColor: Colors.amber,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Sobre a ExploreMundo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'A ExploreMundo é uma empresa de viagens dedicada a oferecer experiências únicas para os amantes de aventura, natureza e cultura. '
                'Com uma equipe apaixonada por explorar o mundo, buscamos proporcionar aos nossos clientes viagens memoráveis e transformadoras.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Nosso Objetivo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nosso objetivo é ser a empresa de viagens preferida dos nossos clientes, oferecendo pacotes e roteiros personalizados, com foco em qualidade, segurança e sustentabilidade.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Missão',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Proporcionar aos nossos clientes experiências de viagem autênticas e inesquecíveis, promovendo o turismo sustentável e respeitando as culturas e o meio ambiente.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Visão',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Ser reconhecida como a empresa líder em inovação e sustentabilidade no setor de turismo, inspirando pessoas a explorar o mundo de forma responsável e consciente.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Valores',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• Paixão por viagens e aventura\n'
                '• Respeito às culturas e ao meio ambiente\n'
                '• Compromisso com a sustentabilidade\n'
                '• Foco na segurança e satisfação do cliente\n'
                '• Inovação e melhoria contínua',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
