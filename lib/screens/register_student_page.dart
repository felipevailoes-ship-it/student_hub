import 'dart:convert';
import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';
import '../data/courses_data.dart';

class RegisterStudentPage extends StatefulWidget {
  const RegisterStudentPage({super.key});

  @override
  State<RegisterStudentPage> createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState extends State<RegisterStudentPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? _selectedCourse;
  String _jsonOutput = '';

  void _generateJson() {
    if (_formKey.currentState?.validate() ?? false) {
      final Map<String, dynamic> data = {
        'name': _nameController.text,
        'email': _emailController.text,
        'age': _ageController.text,
        'course': _selectedCourse,
      };

      setState(() {
        _jsonOutput = jsonEncode(data);
      });
    }
  }

  void _clear() {
    _nameController.clear();
    _emailController.clear();
    _ageController.clear();

    setState(() {
      _selectedCourse = null;
      _jsonOutput = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de estudante'),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor digite seu nome';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor digite seu e-mail';
                        }
                        if (!value.contains('@')) {
                          return 'E-mail inválido';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Idade',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor digite sua idade';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Por favor insira um número valido';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    DropdownButtonFormField<String>(
                      initialValue: _selectedCourse,
                      decoration: const InputDecoration(
                        labelText: 'Curso',
                      ),
                      items: coursesList.map((course) {
                        return DropdownMenuItem<String>(
                          value: course['name'],
                          child: Text(course['name']!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCourse = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor selecione um curso';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: _generateJson,
                      child: const Text('Salvar'),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: _clear,
                      child: const Text('Limpar'),
                    ),

                    const SizedBox(height: 20),

                    Text(_jsonOutput),
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