import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_db/app/modules/home/controllers/home_controller.dart';
import '../../../data/models/note_model.dart';
import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  Note note = Get.arguments;
  final HomeController homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.titleController.text = note.title!;
    controller.descriptionController.text = note.desc!;
    return Scaffold(
        appBar: AppBar(
          title: Text('EditNoteView'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(25),
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Tittle'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Deskripsi'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => ElevatedButton(
                onPressed: () async {
                  if (controller.isLoading.isFalse) {
                    controller.editNote(note.id!);
                    await homeC.getAllNotes();
                  }
                },
                child: Text(
                    controller.isLoading.isFalse ? 'EDIT NOTE' : "LOADING"),
              ),
            )
          ],
        ));
  }
}
