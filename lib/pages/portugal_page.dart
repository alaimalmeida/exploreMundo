import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // construção do widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo', // Título do app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Cor principal do tema
      ),
      home: const PortugalPage(), // Define a página inicial do app
    );
  }
}

class PortugalPage extends StatefulWidget {
  const PortugalPage({super.key});

  @override
  _SlideWithDotsState createState() => _SlideWithDotsState();
}

class _SlideWithDotsState extends State<PortugalPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isStarred = false; // Variável para controlar o estado da estrela

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portugal'),
      ),
      body: ListView(
        children: [
          Container(
            height: 350,
            child: Column(
              children: [
                // Slide (PageView)
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      slideImage('assets/imagens/portugal.png'),
                      slideImage('assets/imagens/portugal.png'),
                      slideImage('assets/imagens/portugal.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  /*1*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Oeschinen Lake Compground',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        'Kandersteq, Switzerland',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                /*3*/
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: _isStarred ? Colors.red : Colors.grey, // Alterna entre vermelho e cinza
                  ),
                  onPressed: () {
                    setState(() {
                      _isStarred = !_isStarred; // Altera o estado ao clicar
                    });
                  },
                ),
                const Text('41'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    Icon(Icons.call, color: Color.fromARGB(255, 5, 90, 201)),
                    Text(
                      'Call',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 90, 201),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.directions, color: Color.fromARGB(255, 5, 90, 201)),
                    Text(
                      'Route',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 90, 201),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.share, color: Color.fromARGB(255, 5, 90, 201)),
                    Text(
                      'Share',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 90, 201),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,',
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget slideImage(String imagePath) {
    return Container(
      color: Colors.white,
      child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 12,
      width: _currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
