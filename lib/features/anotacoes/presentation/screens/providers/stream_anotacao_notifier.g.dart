// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_anotacao_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StreamAnotacaoNotifier)
final streamAnotacaoProvider = StreamAnotacaoNotifierFamily._();

final class StreamAnotacaoNotifierProvider
    extends
        $StreamNotifierProvider<StreamAnotacaoNotifier, List<AnotacaoEntity>> {
  StreamAnotacaoNotifierProvider._({
    required StreamAnotacaoNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'streamAnotacaoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$streamAnotacaoNotifierHash();

  @override
  String toString() {
    return r'streamAnotacaoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  StreamAnotacaoNotifier create() => StreamAnotacaoNotifier();

  @override
  bool operator ==(Object other) {
    return other is StreamAnotacaoNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$streamAnotacaoNotifierHash() =>
    r'811fa2f9246a54026464f974b3c5a3c2ddbc9233';

final class StreamAnotacaoNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          StreamAnotacaoNotifier,
          AsyncValue<List<AnotacaoEntity>>,
          List<AnotacaoEntity>,
          Stream<List<AnotacaoEntity>>,
          String
        > {
  StreamAnotacaoNotifierFamily._()
    : super(
        retry: null,
        name: r'streamAnotacaoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StreamAnotacaoNotifierProvider call({required String producaoId}) =>
      StreamAnotacaoNotifierProvider._(argument: producaoId, from: this);

  @override
  String toString() => r'streamAnotacaoProvider';
}

abstract class _$StreamAnotacaoNotifier
    extends $StreamNotifier<List<AnotacaoEntity>> {
  late final _$args = ref.$arg as String;
  String get producaoId => _$args;

  Stream<List<AnotacaoEntity>> build({required String producaoId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<AnotacaoEntity>>, List<AnotacaoEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<AnotacaoEntity>>,
                List<AnotacaoEntity>
              >,
              AsyncValue<List<AnotacaoEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(producaoId: _$args));
  }
}
