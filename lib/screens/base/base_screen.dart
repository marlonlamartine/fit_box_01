import 'package:fit_box_01/common/custom_drawer/custom_drawer.dart';
import 'package:fit_box_01/models/pageManager.dart';
import 'package:fit_box_01/models/userManager.dart';
import 'package:fit_box_01/screens/activities/activities_screen.dart';
import 'package:fit_box_01/screens/meu_treino/meu_treino_screen.dart';
import 'package:fit_box_01/screens/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PageManager(pageController),
        child: Consumer<UserManager>(
          builder: (_, userManager, __){
            return PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MeuTreinoScreen(),
                PerfilScreen(),
                Scaffold(drawer: CustomDrawer(), appBar: AppBar(title: const Text('Academia'),),),
                ActivitiesScreen(),
              ],
            );
          },
        ),
    );
  }
}
