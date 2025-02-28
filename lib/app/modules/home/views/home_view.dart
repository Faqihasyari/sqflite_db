import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_db/app/data/models/note_model.dart';
import 'package:local_db/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: controller.getAllNotes(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Obx(() => (controller.allNote.length == 0)
                ? Center(
                    child: Text("Tidak ada data"),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      Note note = controller.allNote[index];
                      return ListTile(
                        onTap: () =>
                            Get.toNamed(Routes.EDIT_NOTE, arguments: note),
                        leading: CircleAvatar(child: Text("${note.id}")),
                        title: Text(" ${note.title}"),
                        subtitle: Text(" ${note.desc}"),
                        trailing: IconButton(
                            onPressed: () {
                              controller.deleteNote(note.id!);
                            },
                            icon: Icon(Icons.delete)),
                      );
                    },
                    itemCount: controller.allNote.length,
                  ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_NOTE);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
