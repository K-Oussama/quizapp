import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/services/models.dart';



class FirestoreService {

  // Read all documents from the topics collection
  Future<List<Topic>> getTopics() async {
    final snapshot = await FirebaseFirestore.instance.collection('topics').get();
    var topics = snapshot.docs.map((doc) => Topic.fromJson(doc.data())).toList();
    return topics;
  }

  // Retrieves a single quiz document
  Future<Quiz> getQuiz(String id) async {
    final snapshot = await FirebaseFirestore.instance.collection('quizzes').doc(id).get();
    return Quiz.fromJson(snapshot.data() ?? {});
  }

  // Listens to current user's report document in Firestore
  Stream<Report> reportStream() {
    return AuthService().userStream.switchMap((user) {
      if (user == null) {
        return Stream.fromIterable([Report()]);
      }
      return FirebaseFirestore.instance.collection('reports').doc(user.uid).snapshots().map((snapshot) => Report.fromJson(snapshot.data()!));
      });
  }

  // Updates the current users' report document after completing a quiz
  Future<void> updateUserReport(Quiz quiz) async {
    final user = AuthService().user!;
    var data = {
      'total' : FieldValue.increment(1),
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      }
    };
    return FirebaseFirestore.instance.collection('reports').doc(user.uid).set(data, SetOptions(merge: true));
  }

}