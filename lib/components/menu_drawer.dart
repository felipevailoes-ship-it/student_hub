import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/calculator_page.dart';
import '../screens/register_student_page.dart';
import '../screens/course_page.dart';
import '../screens/login_page.dart';

class MenuDrawer extends StatelessWidget{
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Student Hub'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              Navigator.push(
               context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calculadora'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalculatorPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Cadastrar Aluno'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterStudentPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Cursos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CoursesPage()),
              );
            },
          ),
          //Utilizando do pushandremoveuntil, ele faz o usuário retornar a tela de login sem empilhar a tela por cima das todas
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
              );
            },
          ),
        ],
      )
    );
  }
}