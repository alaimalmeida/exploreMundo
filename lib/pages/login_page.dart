import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Container(
                    width: 200,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Image.asset('assets/imagens/logo-exploremundo.png'),
                  ),

                 TextField(
                  onChanged: (text){
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
        
                const SizedBox(
                  height: 15,
                ),
        
                TextField(
                  onChanged: (text){
                    password = text;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
        
                const SizedBox(
                  height: 15,
                ),
        
                ElevatedButton(
                  child: const Text('Entrar'),
                  onPressed: () {
                    if (email == 'admin' && password == '12345'){
                      Navigator.of(context).pushNamed('/home');
                    }else{
                      print('Login ou senha incorretos');
                    }
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
