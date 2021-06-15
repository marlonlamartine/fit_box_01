import 'package:fit_box_01/screens/login/login_screen.dart';
import 'package:fit_box_01/screens/perfil/meus_dados/meus_dados_screen.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {

  final PageController pageController = PageController(initialPage: 0);

  bool isPageControl(){
    if(pageController.page == 2) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Form(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(child: CircleAvatar(radius: 70, backgroundColor: Colors.blueGrey,)),
            ),
            Center(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    pageController.jumpToPage(2);
                  });

                 /* Navigator.push(context, new MaterialPageRoute(
                      builder: (context) =>
                      new LoginScreen())
                  );*/
                },
                child: Text(
                  'Entre ou Cadastre-se'
                , style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              height: 600,
              width: 800,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: [
                  Center(child: Text('Meu Histórico', style: TextStyle(color: Colors.white),),),
                  Center(child: MeusDadosScreen()),
                  Center(child: LoginScreen(),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
