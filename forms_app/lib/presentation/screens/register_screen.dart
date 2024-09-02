import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlutterLogo(size: 100),
          _RegisterForm(),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => userName = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'Campo Requerido';
              }
              if (value.length < 6) return 'Más de 6 letras';
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'Campo Requerido';
              }
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value)) {
                return 'No tiene formato de correo';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) => password = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'Campo Requerido';
              }
              if (value.length < 6) return 'Más de 6 letras';
              return null;
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final bool? isValid = _formKey.currentState?.validate();
              if (isValid == false) return;
              log(name: 'userName', userName);
              log(name: 'email', email);
              log(name: 'password', password);
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}
