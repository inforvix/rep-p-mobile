
import 'package:rep_p_mobile/src/service/funcionarios_api%20copy.dart';

class MarcacaoRepository {
  Future<void> registrarMarcacao() async {
    try {
      await MarcacaoApi().marcacaoToken();
    } catch (e) {
      print('Erro ao adicionar despesa: $e');
    }
  }
}
