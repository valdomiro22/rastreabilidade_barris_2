import '../../domain/entities/producao_entity.dart';
import '../models/producao_model.dart';

extension ProducaoModelToEntity on ProducaoModel {
  ProducaoEntity toEntity() {
    return ProducaoEntity(
      id: id,
      gradeId: gradeId,
      status: status,
      barrilId: tipoBarrilId,
      produtoId: produtoId,
      quantidadeProgramada: quantidadeProgramada,
      quantidadeProduzida: quantidadeProduzida,
      dataCriacao: dataCriacao,
      dataFimDeProducao: dataFimDeProducao,
    );
  }
}

extension ProducaoEntityToModel on ProducaoEntity {
  ProducaoModel toModel() {
    return ProducaoModel(
      id: id,
      gradeId: gradeId,
      status: status,
      tipoBarrilId: barrilId,
      produtoId: produtoId,
      quantidadeProgramada: quantidadeProgramada,
      quantidadeProduzida: quantidadeProduzida,
      dataCriacao: dataCriacao,
      dataFimDeProducao: dataFimDeProducao,
    );
  }
}
