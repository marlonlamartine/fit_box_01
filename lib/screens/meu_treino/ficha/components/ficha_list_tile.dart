import 'package:flutter/material.dart';

class FichaListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
        child: Container(
          child: Row(
            children: [
              AspectRatio(
                  aspectRatio: 1,
                child: Text('Imagem da ficha'),
              ),
              const SizedBox(width: 16,),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Título do treino'),
                      Text('Descrição'),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
