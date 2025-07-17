import 'package:flutter/material.dart';
import 'package:teslimat/components/my_button.dart';
import 'package:teslimat/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {

  final void Function()? onTap;

   RegisterPage({
    super.key,
    required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
  
@override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical:50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.lock_outline,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                    
                const SizedBox(height: 25),
                    
                //message,app slogan
                Text(
                  "Hesap oluşturun",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                    
                const SizedBox(height: 25),
                    
                // email textfield
                MyTextfield(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                    
                const SizedBox(height: 25),
                    
                //password texfield
                MyTextfield(
                  controller: passwordController,
                  hintText: "Şifre",
                  obscureText: true,
                ),
                    
                const SizedBox(height: 25),
                    
                  MyTextfield(
                  controller: confirmPasswordController,
                  hintText: "Şifreyi onaylayın",
                  obscureText: true,
                ),
                    
                const SizedBox(height: 25),
                    
                //sing in button
                 MyButton(
                  onTap: (){},
                  text: "Kayıt olun",
                ),
                    
                const SizedBox(height: 15),
                    
                //already have an account? login here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Zaten bir hesabınız var mı?",
                      style: TextStyle(fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    
                    const SizedBox(width: 4),
                    
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Şimdi giriş yapın",
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}