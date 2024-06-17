import 'package:flutter/material.dart';
import 'package:somador/components/app_bar_component.dart';
import 'package:somador/components/form_text_field_component.dart';
import 'package:somador/components/main_button_component.dart';
import 'package:somador/controllers/calculator_controller.dart';
import 'package:somador/models/number.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _valueOneController = TextEditingController();
  final _valueTwoController = TextEditingController();
  late String _username;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _username = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Olá $_username',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 80),

          const Text(
            'Entre com os valores',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Form(
            key: _formKey,
            child: Column(
              children: [
                FormTextField(
                  labelText: 'Número 1',
                  obscureText: false,
                  textController: _valueOneController,
                  inputValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o campo número 1';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                FormTextField(
                  labelText: 'Número 2',
                  textController: _valueTwoController,
                  inputValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o campo número 2';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                mainButton(
                  buttonText: 'Calcular',
                  buttonFunction: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        CalculatorController.instance.sum(
                          double.parse(_valueOneController.text),
                          double.parse(_valueTwoController.text),
                        );
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Resultado: ${Number.instance.getCounter().toString()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
