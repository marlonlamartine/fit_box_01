import 'package:fit_box_01/screens/perfil/meus_dados/meus_dados_screen.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return Center(
      child: Form(
        child: ListView(
          children: [
            Container(
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 30, 8, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Fazer Login', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                    Text('Registrar-se', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            CircleAvatar(radius: 70, backgroundColor: Colors.blueGrey,),
            const SizedBox(height: 12,),
            Container(
              height: 600,
              width: 800,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: [
                  Center(child: Text('Meu Histórico', style: TextStyle(color: Colors.white),),),
                  Center(child: MeusDadosScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
