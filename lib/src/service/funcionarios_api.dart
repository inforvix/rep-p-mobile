import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rep_p_mobile/src/common/dados.dart';
import 'package:rep_p_mobile/src/model/funcionario.dart';

class FuncionarioApi {
  Future<http.Response> loginFuncionario(LoginFuncionarioModel funcionario) async {
    final url = Uri.parse('${DadosGlobais.baseUrl}/funcionario/login');
    final headers = {
      'Content-Type': 'application/json'
    };
    final body = json.encode(funcionario.toJson());

    final response = await http.post(url, headers: headers, body: body);

    if(response.statusCode >= 200 && response.statusCode <= 299) {
      final responseBody = json.decode(response.body);
       //print(responseBody);
       //print(responseBody['token']);

       token = responseBody['token'];
       print(token);
      return response;
    } else {
      throw Exception('Falha ao fazer login: ${response.statusCode}');
    }
  }
}




