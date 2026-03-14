// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GradeNotifier)
final gradeProvider = GradeNotifierProvider._();

final class GradeNotifierProvider
    extends $AsyncNotifierProvider<GradeNotifier, List<GradeEntity>> {
  GradeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gradeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gradeNotifierHash();

  @$internal
  @override
  GradeNotifier create() => GradeNotifier();
}

String _$gradeNotifierHash() => r'62b396c94b9d6f499415be6bdbe46083f521c876';

abstract class _$GradeNotifier extends $AsyncNotifier<List<GradeEntity>> {
  FutureOr<List<GradeEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<GradeEntity>>, List<GradeEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<GradeEntity>>, List<GradeEntity>>,
              AsyncValue<List<GradeEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
