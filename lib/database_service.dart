import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static final db = Firestore.instance;
  static final CollectionReference classesRef = db.collection("classes");
  static final CollectionReference attendeesRef = db.collection("classAttendees");

  DatabaseService();

  Stream<QuerySnapshot> upcomingClassesStream() {
    return classesRef.orderBy('timestamp').limit(3).snapshots();
  }

  Future<DocumentSnapshot> getAttendees(String classId) async {
    DocumentSnapshot snapshot = await attendeesRef.document(classId).get();
    return snapshot;
  }
}
