import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Method that creates a collection if it doesn't exist or replaces it if it already exists
  static Future<void> createCollection({
    required String collectionPath,
    required String documentID,
    required String listKey,
    required Map<String, dynamic> map,
  }) async {
    final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
    try {
      await firestoreInstance
          .collection(collectionPath)
          .doc(documentID)
          .set({listKey: map});
    } catch (e) {
      rethrow;
    }
  }

  //Method that fetches a particular document from a specified collection
  static Future<Map<String, dynamic>> fetchDocument({
    required String collectionPath,
    required String documentID,
  }) async {
    final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
    try {
      var documentReference =
          firestoreInstance.collection(collectionPath).doc(documentID);
      final documentSnapshot = await documentReference.get();
      final dataAsMap = documentSnapshot.data() as Map<String, dynamic>;
      return dataAsMap;
    } catch (e) {
      rethrow;
    }
  }
}
