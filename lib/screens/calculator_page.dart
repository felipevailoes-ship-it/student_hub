import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';
import '../components/calculator_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display ='0';
  double _firstNumber = 0;
  double _secondNumber = 0;
  String? _operation;
  bool _startNewNumber = true;


  // chamado para quando um número de 0 a 9 é digitado
  void _pressNumber(String number) {
    setState(() {
      if (_startNewNumber) {
        _display = number;
        _startNewNumber = false;
      } else {
        _display = _display + number;
      }
    });
  }

  void _pressOperation(String operation) {
    setState(() {
      _firstNumber = double.parse(_display);
      _operation = operation;
      _startNewNumber = true;
    });
  }

  void _calculateOperation() {
    _secondNumber = double.parse(_display);

    switch (_operation) {
      case "+":
        _display = (_firstNumber + _secondNumber).toString();
        break;
      case "-":
        _display = (_firstNumber - _secondNumber).toString();
        break;
      case "*":
        _display = (_firstNumber * _secondNumber).toString();
        break;
      case "/":
        if (_secondNumber != 0) {
          _display = (_firstNumber / _secondNumber).toString();
        } else {
          _display = 'Error';
        }
        break;
    }

    _startNewNumber = true;
  }

  void _clear() {
    _display = '0';
    _firstNumber = 0;
    _secondNumber = 0;
    _operation = null;
    _startNewNumber = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Calculadora"),
      ),
      drawer: const MenuDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: Text(
                _display,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(height: 15),
            // Primeira linha
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '7', onPressed: () => _pressNumber('7')),
                CalculatorButton(text: '8', onPressed: () => _pressNumber('8')),
                CalculatorButton(text: '9', onPressed: () => _pressNumber('9')),
                CalculatorButton(
                  text: '÷',
                  onPressed: () {
                    setState(() {
                      _pressOperation('/');
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Segunda linha
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '4', onPressed: () => _pressNumber('4')),
                CalculatorButton(text: '5', onPressed: () => _pressNumber('5')),
                CalculatorButton(text: '6', onPressed: () => _pressNumber('6')),
                CalculatorButton(
                  text: '*',
                  onPressed: () {
                    setState(() {
                      _pressOperation('*');
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Terceira linha
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(text: '1', onPressed: () => _pressNumber('1')),
                CalculatorButton(text: '2', onPressed: () => _pressNumber('2')),
                CalculatorButton(text: '3', onPressed: () => _pressNumber('3')),
                CalculatorButton(
                  text: '-',
                  onPressed: () {
                    setState(() {
                      _pressOperation('-');
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Quarta linha
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: 'C',
                  color: Colors.redAccent,
                  onPressed: () {
                    setState(() {
                      _clear();
                    });
                  },
                ),
                CalculatorButton(text: '0', onPressed: () => _pressNumber('0')),
                  CalculatorButton(
                    text: '=',
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _calculateOperation();
                      });
                    },
                  ),
                CalculatorButton(
                  text: '+',
                  onPressed: () {
                    setState(() {
                      _pressOperation('+');
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}