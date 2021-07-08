import 'package:carousel_pro/carousel_pro.dart';
import 'package:fit_box_01/models/activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {

  ActivityScreen(this.activity);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.name),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 3/2,
            child: Carousel(
              images: activity.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4,
              dotBgColor: Colors.transparent,
              autoplay: false,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Nome da Atividade',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    activity.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Categorias',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                  ),
                  Text(
                      'Peito',
                      style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Text(
                    activity.description,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}
