import 'dart:math';

class Note {
  int? id;
  String? title;
  String? desc;

  Note({this.id, this.title, this.desc});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }

  static List<Note> toJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Note.fromJson(e)).toList();
  }
}
