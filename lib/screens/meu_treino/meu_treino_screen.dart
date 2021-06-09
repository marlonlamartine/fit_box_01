import 'package:fit_box_01/screens/meu_treino/ficha/components/ficha_list_tile.dart';
import 'package:flutter/material.dart';

class MeuTreinoScreen extends StatefulWidget {
  @override
  _MeuTreinoScreenState createState() => _MeuTreinoScreenState();
}

class _MeuTreinoScreenState extends State<MeuTreinoScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Minha Ficha', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}
