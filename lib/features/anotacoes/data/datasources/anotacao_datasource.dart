import 'package:rastreabilidade_barris/features/grades/domain/enums/turno.dart';

import '../models/anotacao_model.dart';

abstract class AnotacaoDatasource {
  Future<void> insertAnotacao({required AnotacaoModel anotacao});

  Future<void> updateAnotacao({required AnotacaoModel anotacao});

  Future<AnotacaoModel?> getAnotacao({required String anotacaoId});

  Future<void> deleteAnotacao({required String anotacaoId});

  Stream<List<AnotacaoModel>> streamAnotacoesDaProducao({required String producaoId});
}
