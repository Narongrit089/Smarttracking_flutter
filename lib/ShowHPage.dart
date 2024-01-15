import 'package:flutter/material.dart';
import 'package:smarttracking/showList.dart';

class DisplayDataPage extends StatefulWidget {
  final Map<String, dynamic> data;

  DisplayDataPage({required this.data});

  @override
  _DisplayDataPageState createState() => _DisplayDataPageState();
}

class _DisplayDataPageState extends State<DisplayDataPage> {
  late TextEditingController idCardController;
  late TextEditingController titleNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController heartValueController;
  late TextEditingController pulseValueController;

  @override
  void initState() {
    super.initState();
    idCardController =
        TextEditingController(text: widget.data['id_card'].toString());
    titleNameController =
        TextEditingController(text: widget.data['titlename'].toString());
    firstNameController =
        TextEditingController(text: widget.data['firstname'].toString());
    lastNameController =
        TextEditingController(text: widget.data['lastname'].toString());
    dateOfBirthController =
        TextEditingController(text: widget.data['date_of_birth'].toString());
    heartValueController =
        TextEditingController(text: widget.data['heart_value'].toString());
    pulseValueController =
        TextEditingController(text: widget.data['pulse_value'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: idCardController,
              decoration: InputDecoration(labelText: 'ID Card'),
            ),
            TextFormField(
              controller: titleNameController,
              decoration: InputDecoration(labelText: 'Title Name'),
            ),
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              controller: dateOfBirthController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            TextFormField(
              controller: heartValueController,
              decoration: InputDecoration(labelText: 'Heart Value'),
            ),
            TextFormField(
              controller: pulseValueController,
              decoration: InputDecoration(labelText: 'Pulse Value'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    idCardController.dispose();
    titleNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    heartValueController.dispose();
    pulseValueController.dispose();
    super.dispose();
  }
}
