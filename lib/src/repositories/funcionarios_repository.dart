import 'package:rep_p_mobile/src/model/funcionario.dart';
import 'package:rep_p_mobile/src/service/funcionarios_api.dart';

class FuncionarioRepository {

  Future<void> login({
    required String cpf,
    required String senha,
  }) async {
    final funcionario = LoginFuncionarioModel(
      cpf: cpf,
      senha: senha,
    );
    try {
      await FuncionarioApi().loginFuncionario(funcionario);
    } catch (e) {
      print('Erro ao adicionar despesa: $e');
    }
  }
}
