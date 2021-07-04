import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_box_01/models/activity.dart';
import 'package:flutter/cupertino.dart';

class ActivityManager extends ChangeNotifier
{
  ActivityManager()
  {
    _loadAllActivities();
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<Activity> allActivities = [];

  String _search = '';

  String get search => _search;

  set search(String value)
  {
    _search = value;
    notifyListeners();
  }



  List<Activity> get filteredActivities
  {
    final List<Activity> filteredActivities = [];

    if(search.isEmpty){
      filteredActivities.addAll(allActivities);
    }
    else{
      filteredActivities.addAll(
          allActivities.where(
                  (a) => a.name.toLowerCase().contains(search.toLowerCase())
          )
      );
    }

    return filteredActivities;
  }



  Future<void> _loadAllActivities() async
  {
    final QuerySnapshot snapshot = await firebaseFirestore.
      collection('activities').get();

    allActivities = snapshot.docs.map(
            (d) => Activity.fromDocument(d)).toList();

    notifyListeners();
  }
}