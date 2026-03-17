// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buscar_um_barril_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BuscarUmBarrilNotifier)
final buscarUmBarrilProvider = BuscarUmBarrilNotifierFamily._();

final class BuscarUmBarrilNotifierProvider
    extends $AsyncNotifierProvider<BuscarUmBarrilNotifier, BarrilEntity> {
  BuscarUmBarrilNotifierProvider._({
    required BuscarUmBarrilNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'buscarUmBarrilProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buscarUmBarrilNotifierHash();

  @override
  String toString() {
    return r'buscarUmBarrilProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BuscarUmBarrilNotifier create() => BuscarUmBarrilNotifier();

  @override
  bool operator ==(Object other) {
    return other is BuscarUmBarrilNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buscarUmBarrilNotifierHash() =>
    r'6ff31f8ef22d2528ea6720d511ed6eeb616397ae';

final class BuscarUmBarrilNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BuscarUmBarrilNotifier,
          AsyncValue<BarrilEntity>,
          BarrilEntity,
          FutureOr<BarrilEntity>,
          String
        > {
  BuscarUmBarrilNotifierFamily._()
    : super(
        retry: null,
        name: r'buscarUmBarrilProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuscarUmBarrilNotifierProvider call({required String barrilId}) =>
      BuscarUmBarrilNotifierProvider._(argument: barrilId, from: this);

  @override
  String toString() => r'buscarUmBarrilProvider';
}

abstract class _$BuscarUmBarrilNotifier extends $AsyncNotifier<BarrilEntity> {
  late final _$args = ref.$arg as String;
  String get barrilId => _$args;

  FutureOr<BarrilEntity> build({required String barrilId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<BarrilEntity>, BarrilEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BarrilEntity>, BarrilEntity>,
              AsyncValue<BarrilEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(barrilId: _$args));
  }
}
