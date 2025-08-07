import 'package:flutter/material.dart';
import 'package:flutter_b21_firebase/models/priority.dart';
import 'package:flutter_b21_firebase/services/priority.dart';

class UpdatePriorityView extends StatefulWidget {
  final PriorityModel model;

  const UpdatePriorityView({super.key, required this.model});

  @override
  State<UpdatePriorityView> createState() => _UpdatePriorityViewState();
}

class _UpdatePriorityViewState extends State<UpdatePriorityView> {
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.model.name.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Priority")),
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
                          .updatePriority(
                            PriorityModel(
                              docId: widget.model.docId.toString(),
                              name: nameController.text,
                            ),
                          )
                          .then((val) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Message"),
                                  content: Text(
                                    "Priority has been updated successfully",
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
                  child: Text("Update Priority"),
                ),
        ],
      ),
    );
  }
}
