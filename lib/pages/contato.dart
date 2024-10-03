import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página de Contato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Contato(),
    );
  }
}

class Contato extends StatefulWidget {
  const Contato({super.key});

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<Contato> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _comentarioController = TextEditingController();

  void _limparCampos() {
    _nomeController.clear();
    _emailController.clear();
    _telefoneController.clear();
    _comentarioController.clear();
  }

  void _mostrarMensagemSucesso() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso'),
          content: const Text('Mensagem enviada com sucesso!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Entre em Contato Conosco',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Formulário de contato
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu e-mail';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Por favor, insira um e-mail válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _telefoneController,
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu telefone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _comentarioController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Comentário',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um comentário';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Ação ao enviar o formulário
                        _limparCampos(); // Limpa os campos
                        _mostrarMensagemSucesso(); // Exibe a mensagem de sucesso
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Outras formas de contato
            const Text(
              'Outras formas de contato:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'E-mail: contato@exploremundo.com',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Telefone: (11) 98765-4321',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),

            // Ícones das Redes Sociais
            const Text(
              'Siga-nos nas redes sociais:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.instagram),
                  color: Colors.purple,
                  iconSize: 40,
                  onPressed: () {
                    // Ação ao clicar no ícone
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.whatsapp),
                  color: Colors.green,
                  iconSize: 40,
                  onPressed: () {
                    // Ação ao clicar no ícone
                  },
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.facebook),
                  color: Colors.blue,
                  iconSize: 40,
                  onPressed: () {
                    // Ação ao clicar no ícone
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
