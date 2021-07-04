import 'package:fit_box_01/common/custom_drawer/custom_drawer.dart';
import 'package:fit_box_01/models/activityManager.dart';
import 'package:fit_box_01/screens/activities/components/activity_list_tile.dart';
import 'package:fit_box_01/screens/activities/components/search_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<ActivityManager>(
          builder: (_, activityManager, __){
            if(activityManager.search.isEmpty){
              return const Text('Atividades');
            }
            else {
              return LayoutBuilder(
                  builder: (_, constraints){
                    return GestureDetector(
                      onTap: () async{
                        final search = await showDialog<String>(
                            context: context, builder: (_) => SearchDialog(
                          activityManager.search
                        ));
                        if(search != null){
                          activityManager.search = search;
                        }
                      },
                      child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                            activityManager.search,
                            textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
              );
            }
          },
        ),
        centerTitle: true,
        actions: [
          Consumer<ActivityManager>(
              builder: (_, activityManager, __){
                if(activityManager.search.isEmpty){
                  return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context, builder: (_) => SearchDialog(
                        activityManager.search
                      ));
                      if(search != null){
                        activityManager.search = search;
                      }
                    },
                  );
                }
                else {
                  return IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () async {
                      activityManager.search = '';
                    },
                  );
                }
              }
          ),
        ],
      ),
      body: Consumer<ActivityManager>(
        builder: (_, activityManager, __){
          final filteredActivities = activityManager.filteredActivities;
          return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: filteredActivities.length,
            itemBuilder: (_, index){
              return ActivityListTile(filteredActivities[index]);
            }
          );
        },
      ),
    );
  }
}
