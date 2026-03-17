// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adicionar_barril_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdicionarBarrilNotifier)
final adicionarBarrilProvider = AdicionarBarrilNotifierProvider._();

final class AdicionarBarrilNotifierProvider
    extends
        $NotifierProvider<AdicionarBarrilNotifier, AdicionarTipoBarrilState> {
  AdicionarBarrilNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adicionarBarrilProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adicionarBarrilNotifierHash();

  @$internal
  @override
  AdicionarBarrilNotifier create() => AdicionarBarrilNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdicionarTipoBarrilState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdicionarTipoBarrilState>(value),
    );
  }
}

String _$adicionarBarrilNotifierHash() =>
    r'865c17fb85de157270117c18a5d5a12747f87b0a';

abstract class _$AdicionarBarrilNotifier
    extends $Notifier<AdicionarTipoBarrilState> {
  AdicionarTipoBarrilState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AdicionarTipoBarrilState, AdicionarTipoBarrilState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AdicionarTipoBarrilState, AdicionarTipoBarrilState>,
              AdicionarTipoBarrilState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
