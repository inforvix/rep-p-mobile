// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:eg_custom_ui/eg_custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:rep_p_mobile/src/common/dados.dart';
import 'package:rep_p_mobile/src/repositories/funcionarios_repository.dart';
import 'package:rep_p_mobile/src/repositories/marcacao.dart';
import 'package:rep_p_mobile/src/ui/cores.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: double.infinity,
            color: PaletaCores.background,
            child: Column(
              children: [
                SizedBox(height: 220),
                EgTextFormWithLabel(
                  label: 'Login',
                  hint: 'Informe seu CPF',
                  controller: cpfController,
                ),
                SizedBox(height: 30),
                EgTextFormWithLabel(
                  label: 'Senha',
                  hint: 'Informe sua senha',
                  controller: senhaController,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Manter Conectado',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                EgButtonCustom(
                  title: 'Registrar Marcação',
                  color: PaletaCores.azulPrimario,
                  function: () async {
                    await FuncionarioRepository().login(
                      cpf: cpfController.text,
                      senha: senhaController.text,
                    );

                    if(DadosGlobais().token != '') {
                      MarcacaoRepository().registrarMarcacao();
                    } 

                  },
                ),
                SizedBox(height: 30),
                EgButtonCustom(
                  title: 'Entrar no Sistema',
                  color: PaletaCores.azulPrimario,
                  function: () {},
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: PaletaCores.azulPrimario,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
