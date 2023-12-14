import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_basic_look/features/register_views/data/post/post.dart';
import 'package:the_basic_look/features/register_views/presntation/widgets/custom_button.dart';
import 'package:the_basic_look/features/register_views/presntation/widgets/custome_text_form_field.dart';
import 'package:the_basic_look/features/register_views/presntation/widgets/row_text.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 40, 39, 39),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomeTextFormField(
              controller: emailController,
              hint: 'EMAIL',
            ),
            const SizedBox(
              height: 24,
            ),
            CustomeTextFormField(
              obscureText: true,
              controller: passwordController,
              hint: 'PASSWORD',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onPressed: () {
                submit(context);
              },
              text: 'SIGN IN',
              horzintalPadding: 24,
            ),
            const SizedBox(
              height: 28,
            ),
            const RowText(),
          ],
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    Post()
        .login(pass: passwordController.text, email: emailController.text)
        .then((success) {
      if (success) {
        GoRouter.of(context).push('/HomeView');
        const snackBar = SnackBar(
          content: Text('successful'),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: Text('not correct'),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
