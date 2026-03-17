import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/barril/domain/entities/barril_entity.dart';
import '../../features/barril/presentation/providers/barril_notifier.dart';
import '../../features/produto/domain/entities/tipo_produto_entity.dart';
import '../../features/produto/presentation/providers/produto_notifier.dart';

extension ProdutoBarrilHelper on WidgetRef {
  ProdutoEntity? produtoPorId(String? id) {
    if (id == null) return null;

    final async = watch(produtoProvider);

    if (async.isLoading) return null;
    if (async.hasError) return null;

    final lista = async.value ?? const <ProdutoEntity>[];

    for (final p in lista) {
      if (p.id == id) return p;
    }
    return null;
  }

  BarrilEntity? barrilPorId(String? id) {
    if (id == null) return null;

    final async = watch(barrilProvider);

    if (async.isLoading) return null;
    if (async.hasError) return null;

    final lista = async.value ?? const <BarrilEntity>[];

    for (final b in lista) {
      if (b.id == id) return b;
    }
    return null;
  }
}
