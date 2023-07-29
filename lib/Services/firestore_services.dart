import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';
import '../exceptions/custom_exception.dart';

final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

class FirestoreService {
  //Method that creates a collection if it doesn't exist or replaces it if it already exists
  static Future<void> createCollection({
    required String collectionPath,
    required String documentID,
    required String listKey,
    required Map<String, dynamic> map,
  }) async {
    try {
      await firestoreInstance
          .collection(collectionPath)
          .doc(documentID)
          .set({listKey: map});
    } on FirebaseException catch (e) {
      throw CustomException(
        errorCode: 300,
        title: errorCodesMap[300][title],
        message: e.message!,
        errorOrigin: ErrorOrigins.notARepository,
      );
    } catch (e) {
      throw CustomException(
        errorCode: 301,
        title: errorCodesMap[301][title],
        message: e.toString(),
        errorOrigin: ErrorOrigins.notARepository,
      );
    }
  }

  //Method that fetches a particular document from a specified collection
  static Future<Map<String, dynamic>> fetchDocument({
    required String collectionPath,
    required String documentID,
  }) async {
    try {
      var documentReference =
          firestoreInstance.collection(collectionPath).doc(documentID);
      final documentSnapshot = await documentReference.get();
      final dataAsMap = documentSnapshot.data() as Map<String, dynamic>;
      return dataAsMap;
    } on FirebaseException catch (e) {
      throw CustomException(
        errorCode: 302,
        title: errorCodesMap[302][title],
        message: e.message!,
        errorOrigin: ErrorOrigins.notARepository,
      );
    } catch (e) {
      throw CustomException(
        errorCode: 303,
        title: errorCodesMap[303][title],
        message: e.toString(),
        errorOrigin: ErrorOrigins.notARepository,
      );
    }
  }
}
