import 'package:flutter/material.dart';

class BotaoWidget extends StatelessWidget {
  final String texto;
  final Function(String) onClick;

  const BotaoWidget({super.key, required this.texto, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => onClick(texto),
          child: Text(texto, style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
