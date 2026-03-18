// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deletar_anotacao_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeletarAnotacaoNotifier)
final deletarAnotacaoProvider = DeletarAnotacaoNotifierProvider._();

final class DeletarAnotacaoNotifierProvider
    extends $NotifierProvider<DeletarAnotacaoNotifier, AsyncValue<dynamic>> {
  DeletarAnotacaoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deletarAnotacaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deletarAnotacaoNotifierHash();

  @$internal
  @override
  DeletarAnotacaoNotifier create() => DeletarAnotacaoNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<dynamic>>(value),
    );
  }
}

String _$deletarAnotacaoNotifierHash() =>
    r'9e221e6a5233408ebbfe3920f2822340dfa7960a';

abstract class _$DeletarAnotacaoNotifier
    extends $Notifier<AsyncValue<dynamic>> {
  AsyncValue<dynamic> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<dynamic>, AsyncValue<dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<dynamic>, AsyncValue<dynamic>>,
              AsyncValue<dynamic>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
