import '../models/barril_model.dart';

abstract class BarrilDatasource {
  Future<void> insertBarril(BarrilModel barril);

  Future<void> updateBarril({required BarrilModel barril, required String tpId});

  Future<BarrilModel?> getBarril(String tpId);

  Future<void> deleteBarril(String tpId);

  Future<List<BarrilModel>> getAllBarris();

  Stream<List<BarrilModel>> streamBarris();
}
