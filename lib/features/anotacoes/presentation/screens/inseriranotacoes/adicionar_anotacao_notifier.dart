import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rastreabilidade_barris/core/di/usecasesproviders/anotacao_use_cases.dart';
import 'package:rastreabilidade_barris/core/utils/string_util.dart';
import 'package:rastreabilidade_barris/features/autenticacao/presentation/buscarusuario/buscar_usuario_notifier.dart';
import 'package:rastreabilidade_barris/features/producoes/presentation/screens/home/selecionar_turno_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entity/anotacao_entity.dart';
import '../../../domain/enums/tipo_codigo.dart';

part 'adicionar_anotacao_notifier.freezed.dart';

part 'adicionar_anotacao_notifier.g.dart';

@riverpod
class AdicionarAnotacaoNotifier extends _$AdicionarAnotacaoNotifier {
  @override
  AdicionarAnotacaoState build() => AdicionarAnotacaoState.inicial();

  void inserirCodigo(String v) {
    state = state.copyWith(codigo: v);
  }

  Future<void> adicionar({
    required String gradeId,
    required String producaoId,
    required TipoCodigo tipoCodigo,
    String? codigo,
  }) async {
    final codigoFinal = codigo ?? state.codigo;

    if (codigoFinal.isEmpty) {
      state = state.copyWith(erro: 'Código inválido ou vazio');
      return;
    }

    state = state.copyWith(isLoading: true, erro: null);
    final usuario = await ref.read(buscarUsuarioProvider.future);
    final turno = ref.read(selecionarTurnoProvider);
    final horarioSemFiltros = StringUtil.formatarHoraSincrona(DateTime.now().toIso8601String());
    final horarioId = horarioSemFiltros.replaceAll(':', '').substring(0, 4);
    final data = StringUtil.hojeSemHorario();
    print('\n\ndata no notifier: $data\n\n');

    final anotacao = AnotacaoEntity(
      gradeId: gradeId,
      producaoId: producaoId,
      codigo: codigoFinal,
      usuarioId: usuario.id!,
      nomeUsuario: usuario.nome,
      turno: turno.turno,
      data: data,
      horario: DateTime.now(),
      horarioId: int.parse(horarioId),
      tipoCodigo: tipoCodigo,
    );

    final useCase = ref.read(insertAnotacaoUseCaseProvider);
    final result = await useCase(anotacao: anotacao);

    result.fold(
      (failure) => state = state.copyWith(isLoading: false, erro: failure.message),
      (_) => state = state.copyWith(isLoading: false, isSucess: true),
    );
  }

  Future<void> lerCodigoBarras({required String gradeId, required String producaoId}) async {
    final link = ref.keepAlive();

    state = state.copyWith(isLoading: true);

    try {
      ScanResult result = await BarcodeScanner.scan();

      if (result.type == ResultType.Cancelled) {
        state = state.copyWith(isLoading: false);
        return;
      }

      String codigoLido = result.rawContent;

      if (codigoLido.isNotEmpty) {
        if (codigoLido.length > 18) {
          codigoLido = codigoLido.substring(0, 18);
        }

        state = state.copyWith(codigo: codigoLido);

        await adicionar(
          gradeId: gradeId,
          producaoId: producaoId,
          codigo: codigoLido,
          tipoCodigo: TipoCodigo.codigoBarras,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: 'Erro ao ler código: $e');
    } finally {
      link.close();
    }
  }

  Future<void> lerQRCode({required String gradeId, required String producaoId}) async {
    final link = ref.keepAlive();

    state = state.copyWith(isLoading: true);

    try {
      ScanResult result = await BarcodeScanner.scan();

      if (result.type == ResultType.Cancelled) {
        state = state.copyWith(isLoading: false);
        return;
      }

      String codigoLido = result.rawContent;

      if (codigoLido.isNotEmpty) {
        if (codigoLido.length > 18) {
          codigoLido = codigoLido.substring(0, 18);
        }

        state = state.copyWith(codigo: codigoLido);

        await adicionar(
          gradeId: gradeId,
          producaoId: producaoId,
          codigo: codigoLido,
          tipoCodigo: TipoCodigo.qrCode,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: 'Erro ao ler código: $e');
    } finally {
      link.close();
    }
  }
}

@freezed
sealed class AdicionarAnotacaoState with _$AdicionarAnotacaoState {
  const factory AdicionarAnotacaoState({
    @Default('') String codigo,
    String? erro,
    String? codigoErro,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    @Default(false) bool camposValidos,
  }) = _AdicionarAnotacaoState;

  factory AdicionarAnotacaoState.inicial() => const AdicionarAnotacaoState();
}
