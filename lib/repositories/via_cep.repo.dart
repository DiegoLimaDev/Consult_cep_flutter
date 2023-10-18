import 'package:cep_consult/domain/via_cep.model.dart';
import 'package:cep_consult/interfaces/via_cep.interface.dart';
import 'package:dio/dio.dart';

class ViaCepRepo implements IViaCep {
  @override
  Future<ViaCepModel> getCep(String cep) async {
    var res = await Dio().get('https://viacep.com.br/ws/$cep/json/');
    if (res.statusCode == 200) {
      return ViaCepModel.fromJson(res.data);
    }
    return ViaCepModel();
  }
}
