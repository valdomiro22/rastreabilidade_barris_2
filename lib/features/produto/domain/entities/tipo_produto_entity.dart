class ProdutoEntity {
  final String? id;
  final String nome;
  final int prazoValidade;

  const ProdutoEntity({this.id, required this.nome, required this.prazoValidade});

  ProdutoEntity copyWith({
    String? id,
    String? nome,
    int? prazoValidade,
  }) {
    return ProdutoEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      prazoValidade: prazoValidade ?? this.prazoValidade,
    );
  }
}
