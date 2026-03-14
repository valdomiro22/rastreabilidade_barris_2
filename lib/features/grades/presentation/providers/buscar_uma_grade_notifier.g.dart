// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buscar_uma_grade_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BuscarUmaGradeNotifier)
final buscarUmaGradeProvider = BuscarUmaGradeNotifierFamily._();

final class BuscarUmaGradeNotifierProvider
    extends $AsyncNotifierProvider<BuscarUmaGradeNotifier, GradeEntity> {
  BuscarUmaGradeNotifierProvider._({
    required BuscarUmaGradeNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'buscarUmaGradeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buscarUmaGradeNotifierHash();

  @override
  String toString() {
    return r'buscarUmaGradeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BuscarUmaGradeNotifier create() => BuscarUmaGradeNotifier();

  @override
  bool operator ==(Object other) {
    return other is BuscarUmaGradeNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buscarUmaGradeNotifierHash() =>
    r'8c3b6eff82ad927023e0a09fd69f321b84ed4153';

final class BuscarUmaGradeNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BuscarUmaGradeNotifier,
          AsyncValue<GradeEntity>,
          GradeEntity,
          FutureOr<GradeEntity>,
          String
        > {
  BuscarUmaGradeNotifierFamily._()
    : super(
        retry: null,
        name: r'buscarUmaGradeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuscarUmaGradeNotifierProvider call({required String gradeId}) =>
      BuscarUmaGradeNotifierProvider._(argument: gradeId, from: this);

  @override
  String toString() => r'buscarUmaGradeProvider';
}

abstract class _$BuscarUmaGradeNotifier extends $AsyncNotifier<GradeEntity> {
  late final _$args = ref.$arg as String;
  String get gradeId => _$args;

  FutureOr<GradeEntity> build({required String gradeId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<GradeEntity>, GradeEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GradeEntity>, GradeEntity>,
              AsyncValue<GradeEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(gradeId: _$args));
  }
}
