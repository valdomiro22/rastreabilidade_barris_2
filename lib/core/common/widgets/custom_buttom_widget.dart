import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CustomButtomWidget extends StatelessWidget {
  final String texto;
  final VoidCallback clique;
  const CustomButtomWidget({super.key, required this.texto, required this.clique});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: clique, child: Text(texto));
  }
}

@Preview(name: 'Botão')
Widget verBotao() {
  return CustomButtomWidget(clique: () {}, texto: 'Salvar');
}
