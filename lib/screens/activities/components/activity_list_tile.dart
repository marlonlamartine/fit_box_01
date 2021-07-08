import 'package:fit_box_01/models/activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityListTile extends StatelessWidget {

  ActivityListTile(this.activity);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/activity', arguments: activity);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
        ),
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              AspectRatio(
                  aspectRatio: 1,
                child: Image.network(activity.images.first),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text('Categoria de Exercício',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 12),
                        ),
                    ),
                    Text('Peito', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
