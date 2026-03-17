// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buscar_producao_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BuscarProducao)
final buscarProducaoProvider = BuscarProducaoFamily._();

final class BuscarProducaoProvider
    extends $AsyncNotifierProvider<BuscarProducao, ProducaoEntity> {
  BuscarProducaoProvider._({
    required BuscarProducaoFamily super.from,
    required ({String gradeId, String producaoId}) super.argument,
  }) : super(
         retry: null,
         name: r'buscarProducaoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buscarProducaoHash();

  @override
  String toString() {
    return r'buscarProducaoProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  BuscarProducao create() => BuscarProducao();

  @override
  bool operator ==(Object other) {
    return other is BuscarProducaoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buscarProducaoHash() => r'988ad3824a80f199dccd3a3beb021e04d6ded817';

final class BuscarProducaoFamily extends $Family
    with
        $ClassFamilyOverride<
          BuscarProducao,
          AsyncValue<ProducaoEntity>,
          ProducaoEntity,
          FutureOr<ProducaoEntity>,
          ({String gradeId, String producaoId})
        > {
  BuscarProducaoFamily._()
    : super(
        retry: null,
        name: r'buscarProducaoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuscarProducaoProvider call({
    required String gradeId,
    required String producaoId,
  }) => BuscarProducaoProvider._(
    argument: (gradeId: gradeId, producaoId: producaoId),
    from: this,
  );

  @override
  String toString() => r'buscarProducaoProvider';
}

abstract class _$BuscarProducao extends $AsyncNotifier<ProducaoEntity> {
  late final _$args = ref.$arg as ({String gradeId, String producaoId});
  String get gradeId => _$args.gradeId;
  String get producaoId => _$args.producaoId;

  FutureOr<ProducaoEntity> build({
    required String gradeId,
    required String producaoId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProducaoEntity>, ProducaoEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProducaoEntity>, ProducaoEntity>,
              AsyncValue<ProducaoEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(gradeId: _$args.gradeId, producaoId: _$args.producaoId),
    );
  }
}
