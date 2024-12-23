import 'package:get/get.dart';

class NoteController extends GetxController {
  var notes = <String, String>{}.obs;
  void updateNote(String cardId, String note) {
    notes[cardId] = note;
  }
  void removeNote(String cardId) {
    notes.remove(cardId);
  }
}
