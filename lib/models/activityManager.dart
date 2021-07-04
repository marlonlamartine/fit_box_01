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

  Future<void> _loadAllActivities() async
  {
    final QuerySnapshot snapshot = await firebaseFirestore.
      collection('activities').get();

    allActivities = snapshot.docs.map(
            (d) => Activity.fromDocument(d)).toList();

    notifyListeners();
  }
}