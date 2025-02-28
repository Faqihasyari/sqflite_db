import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:local_db/app/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class EditNoteController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  
  DatabaseManager database = DatabaseManager.instance;

  void editNote(int id) async {
    Database db = await database.db;
    await db.update(
      "notes",
      {
        "title": titleController.text,
        "desc": descriptionController.text,
      },
      where: "id = ?",
      whereArgs: [id],

    );
    Get.back();
  }
}
