import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_db/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  final HomeController homeC = Get.find();
  AddNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ADD NOTE'),
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
                  if (controller.isLoading.isFalse)  {
                    controller.addNote();
                    await homeC.getAllNotes();
                  }
                },
                child: Text(controller.isLoading.isFalse ?'ADD NOTE' : "LOADING"),
              ),
            )
          ],
        ));
  }
}
