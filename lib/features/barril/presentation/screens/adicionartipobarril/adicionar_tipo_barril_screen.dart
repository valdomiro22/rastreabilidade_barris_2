import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'adicionar_barril_notifier.dart';

class AdicionarBarrilScreen extends ConsumerStatefulWidget {
  const AdicionarBarrilScreen({super.key});

  @override
  ConsumerState<AdicionarBarrilScreen> createState() => _AdicionarBarrilScreenState();
}

class _AdicionarBarrilScreenState extends ConsumerState<AdicionarBarrilScreen> {
  final _nomeController = TextEditingController();
  final _volumeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adicionarBarrilProvider);
    final notifier = ref.watch(adicionarBarrilProvider.notifier);

    ref.listen(adicionarBarrilProvider, (previous, next) {
      if (next.isSucess) {
        notifier.limpar();
        _nomeController.clear();
        _volumeController.clear();
        context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Adicionar tipo de Barril')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Nome'),
            TextField(
              controller: _nomeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Ex: 30L'),
              onChanged: (v) => notifier.inserirNome(v),
            ),
            if (state.erroNome != null)
              Text(state.erroNome ?? '', style: TextStyle(color: Colors.red, fontSize: 12)),
            const SizedBox(height: 10),

            Text('Volume'),
            TextField(
              controller: _volumeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Ex: 50'),
              onChanged: (v) => notifier.inserirVolume(v),
            ),
            if (state.erroVolume != null)
              Text(state.erroVolume ?? '', style: TextStyle(color: Colors.red, fontSize: 12)),
            const SizedBox(height: 16),

            SwitchListTile(
              value: state.isDescartavel,
              onChanged: (v) => notifier.insertIsDescartavel(v),
              title: Text(
                  state.isDescartavel ? 'Descartavel' : 'Retornavel'
              ),
            ),
            const SizedBox(height: 16),

            if (state.isLoading == true)
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Center(child: CircularProgressIndicator()),
              ),

            ElevatedButton(
              onPressed: () => notifier.adicionar(),
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
