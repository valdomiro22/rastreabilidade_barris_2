import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/core/common/widgets/carregando_widget.dart';
import 'package:rastreabilidade_barris/core/common/widgets/mensagem_erro_widget.dart';
import 'package:rastreabilidade_barris/features/anotacoes/presentation/screens/editaranotacao/editar_anotacao_notifier.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entity/anotacao_entity.dart';
import '../../../domain/enums/tipo_codigo.dart';

class EditarAnotacaoScreen extends ConsumerStatefulWidget {
  final AnotacaoEntity anotacao;

  const EditarAnotacaoScreen({super.key, required this.anotacao});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditarAnotacaoScreenState();
}

class _EditarAnotacaoScreenState extends ConsumerState<EditarAnotacaoScreen> {
  final _codigoController = TextEditingController();
  final _obsController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _codigoController.dispose();
    _obsController.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _codigoController.text = widget.anotacao.codigo;
      _obsController.text = widget.anotacao.observacao ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final anotacao = widget.anotacao;

    ref.listen(editarAnotacaoProvider, (previous, next) {
      if (next.isSucess) {
        _codigoController.clear();
        _obsController.clear();
        context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Editar Anotacao')),

      // TODO - falta vincular o usuario para fazer esta verificação
      body: anotacao.tipoCodigo.id == TipoCodigo.anotacao.id ? _codigoDigitado() : _codigoLido(),
    );
  }

  Widget _codigoDigitado() {
    final state = ref.watch(editarAnotacaoProvider);
    final notifier = ref.watch(editarAnotacaoProvider.notifier);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Codigo'),
          SizedBox(height: 4),
          TextField(
            keyboardType: TextInputType.text,
            controller: _codigoController,
            onChanged: (value) => notifier.setCodigo(value),
            decoration: InputDecoration(hintText: 'Código...', border: OutlineInputBorder()),
          ),
          SizedBox(height: 16),
          Text('Observação'),
          SizedBox(height: 4),
          TextField(
            keyboardType: TextInputType.multiline,
            controller: _obsController,
            maxLines: 5,
            minLines: 3,
            onChanged: (value) => notifier.setObservacao(value),
            decoration: InputDecoration(hintText: 'Observação'),
          ),
          if (state.erro != null) MensagemErroWidget(mensagem: state.erro),
          if (state.isLoading) CarregandoWidget(),
          SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => notifier.editar(anotacao: widget.anotacao),
              child: Text('Atualizar', style: TextStyle(color: AppColors.lightSurface)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _codigoLido() {
    final state = ref.watch(editarAnotacaoProvider);
    final notifier = ref.watch(editarAnotacaoProvider.notifier);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.multiline,
            controller: _obsController,
            maxLines: 5,
            minLines: 3,
            onChanged: (value) => notifier.setObservacao(value),
            decoration: InputDecoration(hintText: 'Observação'),
          ),
          if (state.erro != null) MensagemErroWidget(mensagem: state.erro),
          if (state.isLoading) CarregandoWidget(),
          SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => notifier.editar(anotacao: widget.anotacao),
              child: Text('Atualizar', style: TextStyle(color: AppColors.lightSurface)),
            ),
          ),
        ],
      ),
    );
  }
}
