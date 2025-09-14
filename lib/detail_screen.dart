import 'package:flutter/material.dart';
import 'package:time_manager/add_schedule_dialog.dart';

class DetailScreen extends StatefulWidget {
  final String formattedDate;
  const DetailScreen({super.key, required this.formattedDate});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Icon(Icons.alarm, color: Colors.white, size: 40),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Hello Rocky,",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "\nTime is a very scarce resource. Use it wisely!",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Text(
                widget.formattedDate,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Divider(),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      color: Colors.greenAccent,
                      child: Text(
                        "Schedule for the day",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AddScheduleDialog();
                        },
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  scheduleDetails("Work out - 9.00 am", "Medium"),
                  scheduleDetails("Meeting - 11.00 am", "High"),
                  scheduleDetails("Lunch - 2.00 pm", "Medium"),
                  scheduleDetails("Presentation - 4.00 pm", "High"),
                  scheduleDetails("Family Time - 7.00 pm", "High"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row scheduleDetails(String txt, String priority) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(bottom: 6.0),
            decoration: BoxDecoration(
              color: priority == "Medium"
                  ? Colors.yellow.shade200
                  : (priority == "High"
                        ? Colors.lightBlue.shade100
                        : Colors.grey.shade300),
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: RichText(
              text: TextSpan(
                text: txt,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "\n$priority Priority",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: priority == "Medium"
                ? Colors.yellow.shade200
                : (priority == "High"
                      ? Colors.lightBlue.shade100
                      : Colors.grey.shade300),
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.only(bottom: 5.0),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
        ),

        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ],
    );
  }
}
