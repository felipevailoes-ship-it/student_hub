import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // A chave do formulário deve ser única
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos de input do formulário
  // Inicio das regras para formato padrão do e-mail e também da senha
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Direcionamento para a tela da home page, faz uma validação se os campos estão preenchidos
  void _buttonToEnter() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login do aplicativo'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Formulário com os campos
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                      ),
                      validator: (valueEmail) {
                        if (valueEmail == null || valueEmail.isEmpty) {
                          return 'Informe o e-mail';
                        }
                        if (!valueEmail.contains('@')) {
                          return 'E-mail inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height:20),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                      ),
                      validator: (valuePassword) {
                        if (valuePassword == null || valuePassword.isEmpty) {
                          return 'Informe a senha';
                        }
                        if (valuePassword.length < 6) {
                          return 'Informe pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(onPressed: _buttonToEnter, child: const Text('Entrar')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}