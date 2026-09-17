import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';
import 'calculator_page.dart';
import 'course_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Student Hub'),
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Identificação visual do aplicativo
            Row(
              children: [
                Icon(
                  Icons.school,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Student Hub',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Mensagem de boas-vindas
            const Text(
              'Bem-vindo(a) de volta!',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // Cards de funcionalidades
            Card(
              child: ListTile(
                leading: const Icon(Icons.calculate),
                title: const Text('Calculadora'),
                subtitle: const Text('Realize cálculos básicos'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CalculatorPage()),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.school),
                title: const Text('Cursos'),
                subtitle: const Text('Veja os cursos disponíveis'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CoursesPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}