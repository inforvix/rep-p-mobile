// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:eg_custom_ui/eg_custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:rep_p_mobile/src/common/dados.dart';
import 'package:rep_p_mobile/src/repositories/funcionarios_repository.dart';
import 'package:rep_p_mobile/src/repositories/marcacao.dart';
import 'package:rep_p_mobile/src/ui/cores.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
                  label: 'CPF',
                  hint: 'Informe seu CPF',
                  controller: cpfController,
                ),
                SizedBox(height: 30),
                EgTextFormWithLabel(
                  label: 'Senha',
                  hint: 'Informe sua senha',
                  controller: senhaController,
                  obscureText: true,
                  optionShowPassword: true,
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

                    if (token != '') {
                      await MarcacaoRepository().registrarMarcacao();
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: "Marcação realizada com sucesso",
                        ),
                      );
                      token = '';
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          message: "CPF ou senha invalido(s).",
                        ),
                      );
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
