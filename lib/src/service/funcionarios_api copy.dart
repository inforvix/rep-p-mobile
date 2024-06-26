import 'package:http/http.dart' as http;
import 'package:rep_p_mobile/src/common/dados.dart';

class MarcacaoApi {
  Future<http.Response> marcacaoToken() async {
    final url = Uri.parse('${DadosGlobais.baseUrl}/marcacao/registraToken');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${DadosGlobais().token}'
    };

    final response = await http.post(url, headers: headers);

    if(response.statusCode >= 200 && response.statusCode <= 299) {
      print('Registror Marcacao');
      print(response.toString() + 'Resgistrada ');
      return response;
    } else {
      throw Exception('Falha ao fazer login: ${response.statusCode}');
    }
  }
}




