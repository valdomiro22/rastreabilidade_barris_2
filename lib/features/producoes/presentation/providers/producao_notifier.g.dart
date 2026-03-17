// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producao_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProducaoNotifier)
final producaoProvider = ProducaoNotifierFamily._();

final class ProducaoNotifierProvider
    extends $AsyncNotifierProvider<ProducaoNotifier, List<ProducaoEntity>> {
  ProducaoNotifierProvider._({
    required ProducaoNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'producaoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$producaoNotifierHash();

  @override
  String toString() {
    return r'producaoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProducaoNotifier create() => ProducaoNotifier();

  @override
  bool operator ==(Object other) {
    return other is ProducaoNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$producaoNotifierHash() => r'5005ed121aa3713fc5ddefd6e9c48cad7a1ea580';

final class ProducaoNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ProducaoNotifier,
          AsyncValue<List<ProducaoEntity>>,
          List<ProducaoEntity>,
          FutureOr<List<ProducaoEntity>>,
          String
        > {
  ProducaoNotifierFamily._()
    : super(
        retry: null,
        name: r'producaoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProducaoNotifierProvider call({required String gradeId}) =>
      ProducaoNotifierProvider._(argument: gradeId, from: this);

  @override
  String toString() => r'producaoProvider';
}

abstract class _$ProducaoNotifier extends $AsyncNotifier<List<ProducaoEntity>> {
  late final _$args = ref.$arg as String;
  String get gradeId => _$args;

  FutureOr<List<ProducaoEntity>> build({required String gradeId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ProducaoEntity>>, List<ProducaoEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ProducaoEntity>>,
                List<ProducaoEntity>
              >,
              AsyncValue<List<ProducaoEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(gradeId: _$args));
  }
}
