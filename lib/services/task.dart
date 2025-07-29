import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_b21_firebase/models/task.dart';

class TaskServices {
  ///Create Task
  Future createTask(TaskModel model) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .add(model.toJson());
  }

  ///Update Task
  Future updateTask(TaskModel model) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .doc(model.docId)
        .update({'title': model.title, 'description': model.description});
  }

  ///Delete Task
  Future deleteTask(String taskID) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .doc(taskID)
        .delete();
  }

  ///Mark task as Complete
  Future markTaskAsComplete(String taskID) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .doc(taskID)
        .update({'isComplete': true});
  }

  ///Get All Task

  ///Get Completed Task
  ///Get InCompleted Task
  ///Get Priority Task
}
