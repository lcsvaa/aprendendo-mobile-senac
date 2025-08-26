import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_teste_dia_01_agosto/Models/endereco_model.dart';

class ViaCepService {
  Future<Endereco> buscarEndereco(String cep) async {
    Uri uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");

    dynamic response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return Endereco.fromJson(data);
    } else {
      throw Exception("CEP não encotrado ");
    }
  }
}
