// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buscar_uma_anotacao_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BuscarUmaAnotacaoProvider)
final buscarUmaAnotacaoProviderProvider = BuscarUmaAnotacaoProviderFamily._();

final class BuscarUmaAnotacaoProviderProvider
    extends $AsyncNotifierProvider<BuscarUmaAnotacaoProvider, AnotacaoEntity> {
  BuscarUmaAnotacaoProviderProvider._({
    required BuscarUmaAnotacaoProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'buscarUmaAnotacaoProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buscarUmaAnotacaoProviderHash();

  @override
  String toString() {
    return r'buscarUmaAnotacaoProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BuscarUmaAnotacaoProvider create() => BuscarUmaAnotacaoProvider();

  @override
  bool operator ==(Object other) {
    return other is BuscarUmaAnotacaoProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buscarUmaAnotacaoProviderHash() =>
    r'9f6085e1ff5c199f76c94c38aa108e6d99619eac';

final class BuscarUmaAnotacaoProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          BuscarUmaAnotacaoProvider,
          AsyncValue<AnotacaoEntity>,
          AnotacaoEntity,
          FutureOr<AnotacaoEntity>,
          String
        > {
  BuscarUmaAnotacaoProviderFamily._()
    : super(
        retry: null,
        name: r'buscarUmaAnotacaoProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuscarUmaAnotacaoProviderProvider call({required String anotacaoId}) =>
      BuscarUmaAnotacaoProviderProvider._(argument: anotacaoId, from: this);

  @override
  String toString() => r'buscarUmaAnotacaoProviderProvider';
}

abstract class _$BuscarUmaAnotacaoProvider
    extends $AsyncNotifier<AnotacaoEntity> {
  late final _$args = ref.$arg as String;
  String get anotacaoId => _$args;

  FutureOr<AnotacaoEntity> build({required String anotacaoId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AnotacaoEntity>, AnotacaoEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AnotacaoEntity>, AnotacaoEntity>,
              AsyncValue<AnotacaoEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(anotacaoId: _$args));
  }
}
