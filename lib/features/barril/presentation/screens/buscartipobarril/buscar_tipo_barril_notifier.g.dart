// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buscar_tipo_barril_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BuscarTipoBarrilNotifier)
final buscarTipoBarrilProvider = BuscarTipoBarrilNotifierProvider._();

final class BuscarTipoBarrilNotifierProvider
    extends
        $NotifierProvider<BuscarTipoBarrilNotifier, AsyncValue<BarrilEntity?>> {
  BuscarTipoBarrilNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buscarTipoBarrilProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buscarTipoBarrilNotifierHash();

  @$internal
  @override
  BuscarTipoBarrilNotifier create() => BuscarTipoBarrilNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<BarrilEntity?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<BarrilEntity?>>(value),
    );
  }
}

String _$buscarTipoBarrilNotifierHash() =>
    r'bd51230858516cccf8121701e025943fb9ddc9d3';

abstract class _$BuscarTipoBarrilNotifier
    extends $Notifier<AsyncValue<BarrilEntity?>> {
  AsyncValue<BarrilEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<BarrilEntity?>, AsyncValue<BarrilEntity?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BarrilEntity?>, AsyncValue<BarrilEntity?>>,
              AsyncValue<BarrilEntity?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
