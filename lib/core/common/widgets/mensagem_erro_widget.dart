import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class MensagemErroWidget extends StatelessWidget {
  final String? mensagem;

  const MensagemErroWidget({super.key, required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Text(mensagem ?? '' , style: TextStyle(color: Colors.red));
  }
}

@Preview(name: 'Mensagem de Erro')
Widget visualizador() {
  return const MensagemErroWidget(mensagem: 'Deu erro',);
}