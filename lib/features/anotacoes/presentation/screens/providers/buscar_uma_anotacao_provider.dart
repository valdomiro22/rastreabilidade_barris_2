import 'package:rastreabilidade_barris/core/di/usecasesproviders/anotacao_use_cases.dart';
import 'package:rastreabilidade_barris/features/anotacoes/domain/entity/anotacao_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'buscar_uma_anotacao_provider.g.dart';

@riverpod
class BuscarUmaAnotacaoProvider extends _$BuscarUmaAnotacaoProvider {
  @override
  Future<AnotacaoEntity> build({required String anotacaoId}) async {
    final useCase = ref.read(getAnotacaoUseCaseProvider);
    final result = await useCase(anotacaoId: anotacaoId);

    return result.fold((failure) => throw failure, (barril) {
      return barril;
    });
  }
}
