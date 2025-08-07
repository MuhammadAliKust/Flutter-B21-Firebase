import 'package:flutter/material.dart';
import 'package:flutter_b21_firebase/models/priority.dart';
import 'package:flutter_b21_firebase/services/priority.dart';

class CreatePriorityView extends StatefulWidget {
  const CreatePriorityView({super.key});

  @override
  State<CreatePriorityView> createState() => _CreatePriorityViewState();
}

class _CreatePriorityViewState extends State<CreatePriorityView> {
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Priority")),
      body: Column(
        children: [
          TextField(controller: nameController),
          SizedBox(height: 20),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Name cannot be empty.")),
                      );
                      return;
                    }
                    try {
                      isLoading = true;
                      setState(() {});
                      await PriorityServices()
                          .createPriority(
                            PriorityModel(
                              name: nameController.text,
                              createdAt: DateTime.now().millisecondsSinceEpoch,
                            ),
                          )
                          .then((val) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Message"),
                                  content: Text(
                                    "Priority has been created successfully",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Okay"),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                    } catch (e) {
                      isLoading = false;
                      setState(() {});
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: Text("Create Priority"),
                ),
        ],
      ),
    );
  }
}
