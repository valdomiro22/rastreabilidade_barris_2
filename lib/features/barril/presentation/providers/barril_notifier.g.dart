// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barril_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BarrilNotifier)
final barrilProvider = BarrilNotifierProvider._();

final class BarrilNotifierProvider
    extends $AsyncNotifierProvider<BarrilNotifier, List<BarrilEntity>> {
  BarrilNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'barrilProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$barrilNotifierHash();

  @$internal
  @override
  BarrilNotifier create() => BarrilNotifier();
}

String _$barrilNotifierHash() => r'7dd996be92c7f6ceeb36517d741bdfc8b7717282';

abstract class _$BarrilNotifier extends $AsyncNotifier<List<BarrilEntity>> {
  FutureOr<List<BarrilEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<BarrilEntity>>, List<BarrilEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BarrilEntity>>, List<BarrilEntity>>,
              AsyncValue<List<BarrilEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
