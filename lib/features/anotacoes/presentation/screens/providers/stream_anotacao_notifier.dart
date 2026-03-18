import 'package:rastreabilidade_barris/core/di/usecasesproviders/anotacao_use_cases.dart';
import 'package:rastreabilidade_barris/features/anotacoes/domain/entity/anotacao_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_anotacao_notifier.g.dart';

@riverpod
class StreamAnotacaoNotifier extends _$StreamAnotacaoNotifier {
  @override
  Stream<List<AnotacaoEntity>> build({required String producaoId}) {
    final useCase = ref.read(streamAnotacoesUseCaseProvider);
    return useCase(producaoId: producaoId);
  }
}