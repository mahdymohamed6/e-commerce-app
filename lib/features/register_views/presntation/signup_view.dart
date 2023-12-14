import 'package:flutter/material.dart';
import 'package:the_basic_look/features/register_views/data/post/post.dart';
import 'package:the_basic_look/features/register_views/presntation/widgets/custom_button.dart';

import 'widgets/custome_text_form_field.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 40, 39, 39),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomeTextFormField(
            hint: 'NAME',
            controller: nameController,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomeTextFormField(
            hint: 'SURNAME',
            controller: surnameController,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomeTextFormField(
            hint: 'EMAIL',
            controller: emailController,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomeTextFormField(
            obscureText: true,
            hint: 'PASSWORD',
            controller: passwordController,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomeTextFormField(
            obscureText: true,
            hint: 'REPEAT PASSWORD',
            controller: repeatPasswordController,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            onPressed: () {
              // if (passwordController == repeatPasswordController &&
              //     nameController == surnameController) {
              Post().register(
                  name: nameController.text,
                  pass: passwordController.text,
                  email: emailController.text);
            },
            text: 'SIGN UP',
            horzintalPadding: 58,
          ),
        ],
      ),
    );
  }
}
