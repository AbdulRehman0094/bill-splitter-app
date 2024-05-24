import 'package:bill_splitter_app/models/note_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String counterCollection = "counter";
  final String notesCollection = "notes";

  Future<int> getExistingId() async {
    var docRef =
        _firestore.collection(counterCollection).doc(counterCollection);
    var docSnap = await docRef.get();
    if (docSnap.exists) {
      return docSnap.data()?["value"] ?? 1;
    }

    await docRef.set({"value": 1});
    return 1;
  }

  Future<void> saveNote(NoteData note) async {
    await _firestore
        .collection(notesCollection)
        .doc(note.noteId)
        .set(note.toMap());

    int counter = await getExistingId();

    await _firestore
        .collection(counterCollection)
        .doc(counterCollection)
        .set({"value": counter + 1});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllNotes() {
    return _firestore
        .collection(notesCollection)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> removeNote(String noteId) async {
    await _firestore.collection(notesCollection).doc(noteId).delete();
  }
}
