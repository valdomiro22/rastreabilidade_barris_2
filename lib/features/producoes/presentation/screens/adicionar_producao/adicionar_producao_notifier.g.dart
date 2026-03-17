// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adicionar_producao_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormAdicionarProducaoState _$FormAdicionarProducaoStateFromJson(
  Map<String, dynamic> json,
) => _FormAdicionarProducaoState(
  produtoId: json['produtoId'] as String?,
  barrilId: json['barrilId'] as String?,
  quantidade: json['quantidade'] as String?,
  ordem: (json['ordem'] as num?)?.toInt() ?? -1,
  codigo: (json['codigo'] as num?)?.toInt() ?? -1,
  horarioReferente: json['horarioReferente'] as String? ?? '',
  data: json['data'] == null ? null : DateTime.parse(json['data'] as String),
  erro: json['erro'] as String?,
  erroProduto: json['erroProduto'] as String?,
  erroBarril: json['erroBarril'] as String?,
  erroQuantidade: json['erroQuantidade'] as String?,
  erroOrdem: json['erroOrdem'] as String?,
  erroCodigo: json['erroCodigo'] as String?,
  erroGeral: json['erroGeral'] as String?,
  erroData: json['erroData'] as String?,
  isLoading: json['isLoading'] as bool? ?? false,
  isSucess: json['isSucess'] as bool? ?? false,
  camposValidos: json['camposValidos'] as bool? ?? false,
);

Map<String, dynamic> _$FormAdicionarProducaoStateToJson(
  _FormAdicionarProducaoState instance,
) => <String, dynamic>{
  'produtoId': instance.produtoId,
  'barrilId': instance.barrilId,
  'quantidade': instance.quantidade,
  'ordem': instance.ordem,
  'codigo': instance.codigo,
  'horarioReferente': instance.horarioReferente,
  'data': instance.data?.toIso8601String(),
  'erro': instance.erro,
  'erroProduto': instance.erroProduto,
  'erroBarril': instance.erroBarril,
  'erroQuantidade': instance.erroQuantidade,
  'erroOrdem': instance.erroOrdem,
  'erroCodigo': instance.erroCodigo,
  'erroGeral': instance.erroGeral,
  'erroData': instance.erroData,
  'isLoading': instance.isLoading,
  'isSucess': instance.isSucess,
  'camposValidos': instance.camposValidos,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdicionarProducaoNotifier)
final adicionarProducaoProvider = AdicionarProducaoNotifierProvider._();

final class AdicionarProducaoNotifierProvider
    extends
        $NotifierProvider<
          AdicionarProducaoNotifier,
          FormAdicionarProducaoState
        > {
  AdicionarProducaoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adicionarProducaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adicionarProducaoNotifierHash();

  @$internal
  @override
  AdicionarProducaoNotifier create() => AdicionarProducaoNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FormAdicionarProducaoState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FormAdicionarProducaoState>(value),
    );
  }
}

String _$adicionarProducaoNotifierHash() =>
    r'ccd38d9e337dd7c910b6609a3061e316010d43f1';

abstract class _$AdicionarProducaoNotifier
    extends $Notifier<FormAdicionarProducaoState> {
  FormAdicionarProducaoState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<FormAdicionarProducaoState, FormAdicionarProducaoState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                FormAdicionarProducaoState,
                FormAdicionarProducaoState
              >,
              FormAdicionarProducaoState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
