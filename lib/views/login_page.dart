import 'package:flutter/material.dart';
import 'package:somador/components/app_bar_component.dart';
import 'package:somador/components/form_text_field_component.dart';
import 'package:somador/components/main_button_component.dart';
import 'package:somador/components/snack_bar_component.dart';
import 'package:somador/controllers/access_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: 
          MainAxisAlignment.center,
        children: [
          const Text(
            'Login', 
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold)
          ),

          const SizedBox(height: 30),
          
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormTextField(
                  labelText: 'E-mail', 
                  obscureText: false,
                  textController: _emailController,
                  inputValidator: (email) {
                    if(email == null || email.isEmpty) {
                      return 'Preencha o campo e-mail';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 15),

                FormTextField(
                  labelText: 'Senha', 
                  obscureText: true,
                  textController: _passwordController,
                  inputValidator: (password) {
                    if(password == null || password.isEmpty) {
                      return 'Preencha o campo senha';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                mainButton(
                  buttonText: 'Entrar',
                  buttonFunction: () async {

                    final navigator = Navigator.of(context);
                    final messeger = ScaffoldMessenger.of(context);

                    if(_formKey.currentState!.validate()) {
                      bool loginSuccess = await AccessController.instance.loginApi(_emailController.text, _passwordController.text);

                      if(loginSuccess){
                        navigator.pushReplacementNamed('/home', arguments: _emailController.text);
                      } else {
                        messeger.showSnackBar(
                          snackBar(
                            message: 'E-mail e/ou senha incorretos.',
                            color: const Color(0xFFdb6851)
                            )
                          );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
        ),
    );
  }
}