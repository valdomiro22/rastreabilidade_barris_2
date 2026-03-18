// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editar_anotacao_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditarAnotacaoNotifier)
final editarAnotacaoProvider = EditarAnotacaoNotifierProvider._();

final class EditarAnotacaoNotifierProvider
    extends $NotifierProvider<EditarAnotacaoNotifier, EditarAnotacaoState> {
  EditarAnotacaoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editarAnotacaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editarAnotacaoNotifierHash();

  @$internal
  @override
  EditarAnotacaoNotifier create() => EditarAnotacaoNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditarAnotacaoState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditarAnotacaoState>(value),
    );
  }
}

String _$editarAnotacaoNotifierHash() =>
    r'7633a36f0fac35c68910c55033590e660c050693';

abstract class _$EditarAnotacaoNotifier extends $Notifier<EditarAnotacaoState> {
  EditarAnotacaoState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EditarAnotacaoState, EditarAnotacaoState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditarAnotacaoState, EditarAnotacaoState>,
              EditarAnotacaoState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
