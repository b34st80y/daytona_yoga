import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static final db = FirebaseFirestore.instance;
  static final CollectionReference classesRef = db.collection("classes");
  static final CollectionReference attendeesRef =
      db.collection("classAttendees");

  DatabaseService();

  Stream<QuerySnapshot> upcomingClassesStream() {
    return classesRef.orderBy('timestamp').limit(3).snapshots();
  }

  Future<DocumentSnapshot> getAttendees(String classId) {
    return attendeesRef.doc(classId).get();
  }
}
