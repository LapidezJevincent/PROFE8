import 'package:flutter/material.dart';
import 'username_form.dart';
import 'login_form.dart';
import 'multi_input_form.dart';
import 'registration_form.dart';
import 'dropdown_form.dart';
import 'date_time_form.dart';
import 'controller_form.dart';
import 'list_saving_form.dart';

class FormsShowcase extends StatelessWidget {
  const FormsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        UsernameForm(),
        SizedBox(height: 20),
        LoginForm(),
        SizedBox(height: 20),
        MultiInputForm(),
        SizedBox(height: 20),
        RegistrationForm(),
        SizedBox(height: 20),
        DropdownForm(),
        SizedBox(height: 20),
        DateTimeForm(),
        SizedBox(height: 20),
        ControllerForm(),
        SizedBox(height: 20),
        ListSavingForm(),
        SizedBox(height: 40),
      ],
    );
  }
}


