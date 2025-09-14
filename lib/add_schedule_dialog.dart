import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:time_manager/local_storage.dart';

class AddScheduleDialog extends StatefulWidget {
  const AddScheduleDialog({super.key});

  @override
  State<AddScheduleDialog> createState() => _AddScheduleDialogState();
}

class _AddScheduleDialogState extends State<AddScheduleDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController activityController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priorityController = TextEditingController();

  Future<void> _saveSchedule(BuildContext context) async {
    if (activityController.text.trim().isEmpty ||
        timeController.text.trim().isEmpty ||
        priorityController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "Error !\nPlease fill in all the fields. ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 18.0,
      );
    } else {
      Map<String, dynamic> schedule;

      schedule = {
        "activity": activityController.text,
        "time": timeController.text,
        "priority": priorityController.text,
      };

      saveUserData(schedule);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    activityController.dispose();
    timeController.dispose();
    priorityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Form(
        key: formKey,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(width: 10),
                const Text(
                  'Add Activity',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                TextFormField(
                  controller: activityController,
                  decoration: InputDecoration(labelText: "Add Activity"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(labelText: "Add Time"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: priorityController,
                  decoration: InputDecoration(labelText: "Set Priority"),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateColor.resolveWith(
                          (states) => Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        _saveSchedule(context);
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateColor.resolveWith(
                          (states) => Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
