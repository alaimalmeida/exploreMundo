import 'package:exploremundo/pages/brasil_page.dart';
import 'package:exploremundo/pages/chile_page.dart'; 
import 'package:exploremundo/pages/contato.dart';
import 'package:exploremundo/pages/destinos.dart';
import 'package:exploremundo/pages/japao_page.dart';
import 'package:exploremundo/pages/login_page.dart';
import 'package:exploremundo/pages/mexico_page.dart';
import 'package:exploremundo/pages/pacotes.dart';
import 'package:exploremundo/pages/portugal_page.dart';
import 'package:exploremundo/pages/sobre.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const MyHomePage(),
        '/destinos': (context) => const Destinos(),
        '/pacotes': (context) => const Pacotes(),
        '/contato': (context) => const Contato(),
        '/sobre': (context) => const Sobre(),
        '/brasil_page': (context) => const BrasilPage(), 
        '/portugal_page': (context) => const PortugalPage(), 
        '/japao_page': (context) => const JapaoPage(),
        '/chile_page': (context) => const ChilePage(), 
        '/mexico_page': (context) => const MexicoPage(), 
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> destinosPacotes = [
    {'title': 'Brasil', 'details': 'São Paulo - R\$250 - R\$600', 'favorited': false, 'image': 'assets/imagens/brasil.png'},
    {'title': 'Portugal', 'details': 'Lisboa - R\$300 - R\$700', 'favorited': false, 'image': 'assets/imagens/portugal.png'},
    {'title': 'Japão', 'details': 'Tóquio - R\$400 - R\$900', 'favorited': false, 'image': 'assets/imagens/japao.png'},
    {'title': 'Chile', 'details': 'Santiago - R\$500 - R\$800', 'favorited': false, 'image': 'assets/imagens/chile.png'},
    {'title': 'México', 'details': 'Cancún - R\$600 - R\$900', 'favorited': false, 'image': 'assets/imagens/mexico.png'},
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

  void _toggleFavorito(int index) {
    setState(() {
      resultadosBusca[index]['favorited'] = !resultadosBusca[index]['favorited'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          BannerSection(onSearch: _filtrarDestinos),
          const NavigationMenu(),
          Expanded(
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
                    isFavorited: destino['favorited'],
                    onPressed: () {
                      // Navega para a página do destino específico
                      String route = '';
                      switch (destino['title']) {
                        case 'Brasil':
                          route = '/brasil_page';
                          break;
                        case 'Portugal':
                          route = '/portugal_page';
                          break;
                        case 'Japão':
                          route = '/japao_page';
                          break;
                        case 'Chile':
                          route = '/chile_page';
                          break;
                        case 'México':
                          route = '/mexico_page';
                          break;
                        default:
                          print('Página não encontrada');
                      }
                      Navigator.pushNamed(context, route);
                    },
                    onFavoritar: () => _toggleFavorito(index),
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
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imagens/imgpraia.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
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
        ),
      ],
    );
  }
}

// Menu de Navegação
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.location_pin, 'label': 'Destinos', 'route': '/destinos'},
      {'icon': Icons.card_travel, 'label': 'Pacotes', 'route': '/pacotes'},
      {'icon': Icons.call, 'label': 'Contato', 'route': '/contato'},
      {'icon': Icons.sticky_note_2, 'label': 'Sobre', 'route': '/sobre'},
    ];

    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: menuItems.map((item) {
          return TextButton(
            onPressed: () => Navigator.of(context).pushNamed(item['route']),
            child: Column(
              children: [
                Icon(item['icon'], size: 40, color: Colors.red[500]),
                Text(item['label'], style: const TextStyle(fontSize: 20)),
              ],
            ),
          );
        }).toList(),
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
  final VoidCallback onFavoritar;
  final bool isFavorited;

  const DestinationCard({
    required this.title,
    required this.details,
    required this.onPressed,
    required this.onFavoritar,
    required this.isFavorited,
    required this.image,
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
            IconButton(
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: isFavorited ? Colors.red : null,
              ),
              onPressed: onFavoritar,
            ),
          ],
        ),
      ),
    );
  }
}


