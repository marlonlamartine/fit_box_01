import 'package:fit_box_01/common/custom_drawer/custom_drawer.dart';
import 'package:fit_box_01/screens/meu_treino/ficha/components/ficha_list_tile.dart';
import 'package:flutter/material.dart';

class MeuTreinoScreen extends StatefulWidget {
  @override
  _MeuTreinoScreenState createState() => _MeuTreinoScreenState();
}

class _MeuTreinoScreenState extends State<MeuTreinoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meu Treino'),
      ),
    );
  }
}
