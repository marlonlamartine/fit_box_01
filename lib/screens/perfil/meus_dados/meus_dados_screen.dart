import 'package:flutter/material.dart';

class MeusDadosScreen extends StatefulWidget {
  @override
  _MeusDadosScreenState createState() => _MeusDadosScreenState();
}

class _MeusDadosScreenState extends State<MeusDadosScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Meus Dados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Nome Completo',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  prefixIcon: const Icon(Icons.title, color: Colors.white,)
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'E-mail',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  prefixIcon: const Icon(Icons.mail_outline, color: Colors.white,)
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.white,)
              ),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
