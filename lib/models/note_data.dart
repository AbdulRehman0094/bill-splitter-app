import 'package:cloud_firestore/cloud_firestore.dart';

class NoteData {
  late String noteId;
  late String title;
  late String description;
  late DateTime timestamp;

  NoteData({
    required this.noteId,
    required this.title,
    required this.description,
    required this.timestamp,
  });

  NoteData.fromMap(Map<String, dynamic> data)
      : noteId = data["noteId"],
        title = data["title"],
        description = data["description"],
        timestamp = (data["timestamp"] as Timestamp).toDate();

  Map<String, dynamic> toMap() {
    return {
      "noteId": noteId,
      "title": title,
      "description": description,
      "timestamp": timestamp,
    };
  }
}
