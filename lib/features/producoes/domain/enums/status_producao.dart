enum StatusProducao {
  concluida(id: 1, label: 'Concluido'),
  naoConcluida(id: 2, label: 'Não concluido');

  const StatusProducao({required this.id, required this.label});

  final int id;
  final String label;

  static StatusProducao fronId(int id) {
    return StatusProducao.values.firstWhere(
      (tipo) => tipo.id == id,
      orElse: () => throw Exception('Id de TipoBarril inválido: $id'),
    );
  }
}
