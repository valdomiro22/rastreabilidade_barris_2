import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CarregandoWidget extends StatelessWidget {
  const CarregandoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16),
      child: Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}

@Preview(name: 'Carregando')
Widget verCarregando() {
  return const CarregandoWidget();
}