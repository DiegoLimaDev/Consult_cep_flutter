import 'package:cep_consult/domain/via_cep.model.dart';

abstract class IViaCep {
  Future<ViaCepModel> getCep(String cep);
}
