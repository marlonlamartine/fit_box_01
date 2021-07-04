import 'package:fit_box_01/common/custom_drawer/custom_drawer_header.dart';
import 'package:fit_box_01/common/custom_drawer/drawer_tile.dart';
import 'package:fit_box_01/main.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,//const Color.fromARGB(255, 203, 236, 241),
                    Theme.of(context).primaryColor, //Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),
          ListView(
            children: [
              CustomDrawerHeader(),
              const Divider(),
              DrawerTile(iconData: Icons.list, title: 'Meu treino', page: 0,),
              DrawerTile(iconData: Icons.person_rounded, title: 'Perfil', page: 1,),
              DrawerTile(iconData: Icons.account_balance, title: 'Academia', page: 2,),
              DrawerTile(iconData: Icons.accessibility_new, title: 'Exercícios', page: 3,),
            ],
          )
        ],
      ),
    );
  }
}
