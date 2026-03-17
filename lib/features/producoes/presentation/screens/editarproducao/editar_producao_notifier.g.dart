// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editar_producao_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditarProducaoState _$EditarProducaoStateFromJson(Map<String, dynamic> json) =>
    _EditarProducaoState(
      produtoId: json['produtoId'] as String?,
      barrilId: json['barrilId'] as String?,
      quantidade: json['quantidade'] as String?,
      ordem: (json['ordem'] as num?)?.toInt() ?? -1,
      codigo: (json['codigo'] as num?)?.toInt() ?? -1,
      horarioReferente: json['horarioReferente'] as String? ?? '',
      data: json['data'] == null
          ? null
          : DateTime.parse(json['data'] as String),
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

Map<String, dynamic> _$EditarProducaoStateToJson(
  _EditarProducaoState instance,
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

@ProviderFor(EditarProducaoNotifier)
final editarProducaoProvider = EditarProducaoNotifierProvider._();

final class EditarProducaoNotifierProvider
    extends $NotifierProvider<EditarProducaoNotifier, EditarProducaoState> {
  EditarProducaoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editarProducaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editarProducaoNotifierHash();

  @$internal
  @override
  EditarProducaoNotifier create() => EditarProducaoNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditarProducaoState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditarProducaoState>(value),
    );
  }
}

String _$editarProducaoNotifierHash() =>
    r'8e4a225c958f0b141ef24ef685ab9a6e3e8cf229';

abstract class _$EditarProducaoNotifier extends $Notifier<EditarProducaoState> {
  EditarProducaoState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EditarProducaoState, EditarProducaoState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditarProducaoState, EditarProducaoState>,
              EditarProducaoState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
