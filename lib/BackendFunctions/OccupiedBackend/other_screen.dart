import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveChecklistData({
    required List<Map<String, dynamic>> checklistData,
    required String textFieldValue1,
    required String textFieldValue2,
  }) async {
    try {
      await _firestore.collection('checklists').add({
        'checklistData': checklistData,
        'textField1': textFieldValue1,
        'textField2': textFieldValue2,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }
}
