import '../../domain/entities/barril_entity.dart';
import '../models/barril_model.dart';

extension BarrilModelToEntity on BarrilModel {
  BarrilEntity toEntity() {
    return BarrilEntity(id: id, nome: nome, volume: volume, isDescartavel: isDescartavel);
  }
}

extension BarrilEntityToModel on BarrilEntity {
  BarrilModel toModel() {
    return BarrilModel(id: id, nome: nome, volume: volume, isDescartavel: isDescartavel);
  }
}
