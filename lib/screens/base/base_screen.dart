import 'package:fit_box_01/screens/meu_treino/meu_treino_screen.dart';
import 'package:fit_box_01/screens/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        MeuTreinoScreen(),
        PerfilScreen(),
      ],
    );
  }
}
