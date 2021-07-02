import 'package:fit_box_01/helpers/validators.dart';
import 'package:fit_box_01/models/userManager.dart';
import 'package:fit_box_01/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Usuario user = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('CRIAR CONTA'),
        centerTitle: true,
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
                      decoration: const InputDecoration(hintText: 'Nome Completo'),
                      enabled: !userManager.loading,
                      validator: (name){
                        if(name.isEmpty)
                          return 'Campo Obrigatório';
                        else if(name.trim().split(' ').length <= 1)
                          return 'Preencha seu nome completo';
                        return null;
                      },
                      onSaved: (name) => user.name = name,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email){
                        if(email.isEmpty)
                          return 'Campo Obrigatório';
                        else if (!emailValid(email))
                          return 'E-mail Inválido';
                        return null;
                      },
                      onSaved: (email) => user.email = email,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Senha'),
                      enabled: !userManager.loading,
                      obscureText: true,
                      validator: (pass){
                        if(pass.isEmpty)
                          return 'Campo Obrigatório';
                        else if(pass.length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => user.password = pass,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Repita a Senha'),
                      enabled: !userManager.loading,
                      obscureText: true,
                      validator: (pass){
                        if(pass.isEmpty)
                          return 'Campo Obrigatório';
                        else if(pass.length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => user.confirmPassword = pass,
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            onSurface: Theme.of(context).primaryColor.withAlpha(100)
                        ),
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState.validate()){
                            formKey.currentState.save();

                            if(user.password != user.confirmPassword){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Senhas não coincidem'),
                                    backgroundColor: Colors.red,
                                  )
                              );
                            }
                            userManager.signUp(
                                usuario: user,
                                onSuccess: (){
                                  Navigator.of(context).pop();
                                },
                                onFail: (e){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Falha ao Cadastrar: $e'),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                }
                            );
                          }
                        },
                        child: userManager.loading ?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ) :
                        const Text('Criar Conta', style: TextStyle(fontSize: 18),),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
