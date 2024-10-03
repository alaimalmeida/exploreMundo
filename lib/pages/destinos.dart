import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destinos e Pesquisa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Destinos(),
    );
  }
}

class Destinos extends StatefulWidget {
  const Destinos({super.key});

  @override
  _DestinosPageState createState() => _DestinosPageState();
}

class _DestinosPageState extends State<Destinos> {
  final List<Map<String, dynamic>> destinosPacotes = [
    {'title': 'Brasil', 'details': 'São Paulo - R\$250 - R\$600', 'image': 'assets/imagens/brasil.png'},
    {'title': 'Portugal', 'details': 'Lisboa - R\$300 - R\$700', 'image': 'assets/imagens/portugal.png'},
    {'title': 'Japão', 'details': 'Tóquio - R\$400 - R\$900', 'image': 'assets/imagens/japao.png'},
    {'title': 'Chile', 'details': 'Santiago - R\$500 - R\$800', 'image': 'assets/imagens/chile.png'},
    {'title': 'México', 'details': 'Cancún - R\$600 - R\$900', 'image': 'assets/imagens/mexico.png'},
  ];

  List<Map<String, dynamic>> resultadosBusca = [];

  @override
  void initState() {
    super.initState();
    resultadosBusca = destinosPacotes;
  }

  void _filtrarDestinos(String query) {
    setState(() {
      resultadosBusca = destinosPacotes
          .where((destino) => destino['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Imagem de fundo
                Positioned.fill(
                  child: Image.asset(
                    'assets/imagens/imgpraia.png', // Caminho da imagem local
                    fit: BoxFit.cover,
                  ),
                ),
                // Campo de pesquisa por cima da imagem
                BannerSection(onSearch: _filtrarDestinos),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: resultadosBusca.length,
              itemBuilder: (context, index) {
                final destino = resultadosBusca[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DestinationCard(
                    title: destino['title']!,
                    details: destino['details']!,
                    image: destino['image']!,
                    onPressed: () {
                      // Ação ao clicar no card
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Seção de Banner com Pesquisa
class BannerSection extends StatelessWidget {
  final Function(String) onSearch;

  const BannerSection({required this.onSearch, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20, // Posição do campo de pesquisa
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          onChanged: onSearch,
          decoration: const InputDecoration(
            labelText: 'Pesquisar',
            border: InputBorder.none,
            icon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

// Cards de Destinos
class DestinationCard extends StatelessWidget {
  final String title;
  final String details;
  final String image;
  final VoidCallback onPressed;

  const DestinationCard({
    required this.title,
    required this.details,
    required this.image,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 390,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 232, 235),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(image, width: 90), // Mostra a imagem do destino
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 30)),
                  Text(details, style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
