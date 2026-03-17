// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProdutoNotifier)
final produtoProvider = ProdutoNotifierProvider._();

final class ProdutoNotifierProvider
    extends $AsyncNotifierProvider<ProdutoNotifier, List<ProdutoEntity>> {
  ProdutoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'produtoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$produtoNotifierHash();

  @$internal
  @override
  ProdutoNotifier create() => ProdutoNotifier();
}

String _$produtoNotifierHash() => r'ea9401924e8c622977e648345417727411e17964';

abstract class _$ProdutoNotifier extends $AsyncNotifier<List<ProdutoEntity>> {
  FutureOr<List<ProdutoEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProdutoEntity>>, List<ProdutoEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProdutoEntity>>, List<ProdutoEntity>>,
              AsyncValue<List<ProdutoEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
