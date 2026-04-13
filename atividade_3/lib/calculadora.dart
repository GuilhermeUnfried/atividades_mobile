import 'package:flutter/material.dart';
import 'widgets/display.dart';
import 'widgets/linha_botoes.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String display = '0';
  double n1 = 0;
  String op = '';
  bool novoNumero = false;

  void acao(String valor) {
    setState(() {
      if (valor == 'C') {
        display = '0';
        n1 = 0;
        op = '';
        novoNumero = false;
      } else if (['+', '-', '*', '/'].contains(valor)) {
        n1 = double.tryParse(display) ?? 0;
        op = valor;
        novoNumero = true;
      } else if (valor == '=') {
        final n2 = double.tryParse(display) ?? 0;
        double resultado = n1;
        if (op == '+') resultado = n1 + n2;
        if (op == '-') resultado = n1 - n2;
        if (op == '*') resultado = n1 * n2;
        if (op == '/') resultado = n2 == 0 ? 0 : n1 / n2;
        display = resultado % 1 == 0 ? resultado.toInt().toString() : resultado.toString();
        op = '';
        novoNumero = true;
      } else {
        if (display == '0' || novoNumero) {
          display = valor;
          novoNumero = false;
        } else {
          display += valor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Column(
        children: [
          DisplayWidget(display: display),
          LinhaBotoes(['7', '8', '9', '/'], acao),
          LinhaBotoes(['4', '5', '6', '*'], acao),
          LinhaBotoes(['1', '2', '3', '-'], acao),
          LinhaBotoes(['C', '0', '=', '+'], acao),
        ],
      ),
    );
  }
}
