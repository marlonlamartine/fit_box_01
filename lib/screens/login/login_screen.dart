import 'package:fit_box_01/helpers/validators.dart';
import 'package:fit_box_01/models/userManager.dart';
import 'package:fit_box_01/models/usuario.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/signup');
              },
            child: const Text('CRIAR CONTA', style: TextStyle(fontSize: 14, color: Colors.white),),
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __){
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email){
                        if(!emailValid(email)){
                          return 'Email inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: passController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass){
                        if(pass.isEmpty || pass.length < 6) {
                          return 'Senha inválida';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (){},
                        child: Text('Esqueci Minha Senha'),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState.validate()){
                            userManager.signIn(
                                user: Usuario(
                                    email: emailController.text,
                                    password: passController.text
                                ),
                                onFail: (e){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('FALHA AO ENTRAR: $e'),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                },
                                onSuccess: (){
                                  Navigator.of(context).pop();
                                }
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          onSurface: Theme.of(context).primaryColor.withAlpha(100)
                        ),
                        child: userManager.loading
                            ?
                            const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                            :
                        const Text('Entrar', style: TextStyle(fontSize: 18),),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
