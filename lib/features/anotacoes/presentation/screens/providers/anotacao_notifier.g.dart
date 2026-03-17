// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anotacao_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AnotacaoNotifier)
final anotacaoProvider = AnotacaoNotifierFamily._();

final class AnotacaoNotifierProvider
    extends $AsyncNotifierProvider<AnotacaoNotifier, List<AnotacaoEntity>> {
  AnotacaoNotifierProvider._({
    required AnotacaoNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'anotacaoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$anotacaoNotifierHash();

  @override
  String toString() {
    return r'anotacaoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AnotacaoNotifier create() => AnotacaoNotifier();

  @override
  bool operator ==(Object other) {
    return other is AnotacaoNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$anotacaoNotifierHash() => r'f501912890a53fb29190ea4aaf4666a0148df7c9';

final class AnotacaoNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          AnotacaoNotifier,
          AsyncValue<List<AnotacaoEntity>>,
          List<AnotacaoEntity>,
          FutureOr<List<AnotacaoEntity>>,
          String
        > {
  AnotacaoNotifierFamily._()
    : super(
        retry: null,
        name: r'anotacaoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AnotacaoNotifierProvider call({required String producaoId}) =>
      AnotacaoNotifierProvider._(argument: producaoId, from: this);

  @override
  String toString() => r'anotacaoProvider';
}

abstract class _$AnotacaoNotifier extends $AsyncNotifier<List<AnotacaoEntity>> {
  late final _$args = ref.$arg as String;
  String get producaoId => _$args;

  FutureOr<List<AnotacaoEntity>> build({required String producaoId});
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
