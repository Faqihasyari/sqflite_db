import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:local_db/app/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class AddNoteController extends GetxController {
  RxBool isLoading = false.obs;
  DatabaseManager database = DatabaseManager.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addNote() async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      isLoading.value = true;
      Database db = await database.db;
      await db.insert('notes', {
        "title": titleController.text,
        "desc": descriptionController.text,
      });
      isLoading.value = false;

      Get.back();
    }
  }
}
