import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fit_box_01/screens/meu_treino/meu_treino_screen.dart';
import 'package:fit_box_01/screens/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 1;

  final Color colorPrimary = Color(0xFF143642);

  final Color colorLight = Color(0xFF26667d);

  final Color colorDark = Color(0xFF08161b);

  final telas = [
    Center(child: PerfilScreen(),),
    Center(child: MeuTreinoScreen(),),
    Center(child: Text('Academia'),),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colorPrimary,
                    colorLight
                  ]
              )
          ),
          child: telas[_currentIndex],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          initialIndex: _currentIndex,
          backgroundColor: colorLight,
          color: Colors.white,
          items: [
            Icon(Icons.person_rounded, size: 30,),
            Icon(Icons.list, size: 30,),
            Icon(Icons.account_balance, size: 30,),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}


