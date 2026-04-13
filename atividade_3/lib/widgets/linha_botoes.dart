import 'package:flutter/material.dart';
import 'botao.dart';

class LinhaBotoes extends StatelessWidget {
  final List<String> botoes;
  final Function(String) onClick;

  const LinhaBotoes(this.botoes, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: botoes
          .map((texto) => BotaoWidget(texto: texto, onClick: onClick))
          .toList(),
    );
  }
}
