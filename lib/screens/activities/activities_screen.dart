import 'package:fit_box_01/common/custom_drawer/custom_drawer.dart';
import 'package:fit_box_01/models/activityManager.dart';
import 'package:fit_box_01/screens/activities/components/activity_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Atividades'),
        centerTitle: true,
      ),
      body: Consumer<ActivityManager>(
        builder: (_, activityManager, __){
          return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: activityManager.allActivities.length,
            itemBuilder: (_, index){
              return ActivityListTile(activityManager.allActivities[index]);
            }
          );
        },
      ),
    );
  }
}
