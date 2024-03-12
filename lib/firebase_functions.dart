import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/task-model.dart';
import 'package:todo_app/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }


  static Stream<QuerySnapshot<TaskModel>> getTasks(){
    return getTaskCollection()
        .snapshots();
  }

  static Future<void> addTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }

  static Future<TaskModel?> getTaskById(String taskId) async {
    var docRef = getTaskCollection().doc(taskId);
    var snapshot = await docRef.get();
    if(snapshot.exists){
      return snapshot.data();
    }
    return null;
  }


  static Future<void> editTask(TaskModel taskModel){
    var docRef = getTaskCollection().doc(taskModel.id);
    var taskMap = taskModel.toJson();
    return docRef.update(taskMap);
  }


  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance.collection("Users").withConverter(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }



}
