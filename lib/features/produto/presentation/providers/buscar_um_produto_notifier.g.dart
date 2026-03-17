// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buscar_um_produto_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BuscarUmProdutoNotifier)
final buscarUmProdutoProvider = BuscarUmProdutoNotifierFamily._();

final class BuscarUmProdutoNotifierProvider
    extends $AsyncNotifierProvider<BuscarUmProdutoNotifier, ProdutoEntity> {
  BuscarUmProdutoNotifierProvider._({
    required BuscarUmProdutoNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'buscarUmProdutoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buscarUmProdutoNotifierHash();

  @override
  String toString() {
    return r'buscarUmProdutoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BuscarUmProdutoNotifier create() => BuscarUmProdutoNotifier();

  @override
  bool operator ==(Object other) {
    return other is BuscarUmProdutoNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buscarUmProdutoNotifierHash() =>
    r'377e60a5b529af475de8e486cb96994751eb4937';

final class BuscarUmProdutoNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BuscarUmProdutoNotifier,
          AsyncValue<ProdutoEntity>,
          ProdutoEntity,
          FutureOr<ProdutoEntity>,
          String
        > {
  BuscarUmProdutoNotifierFamily._()
    : super(
        retry: null,
        name: r'buscarUmProdutoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuscarUmProdutoNotifierProvider call({required String produtoId}) =>
      BuscarUmProdutoNotifierProvider._(argument: produtoId, from: this);

  @override
  String toString() => r'buscarUmProdutoProvider';
}

abstract class _$BuscarUmProdutoNotifier extends $AsyncNotifier<ProdutoEntity> {
  late final _$args = ref.$arg as String;
  String get produtoId => _$args;

  FutureOr<ProdutoEntity> build({required String produtoId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProdutoEntity>, ProdutoEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProdutoEntity>, ProdutoEntity>,
              AsyncValue<ProdutoEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(produtoId: _$args));
  }
}
