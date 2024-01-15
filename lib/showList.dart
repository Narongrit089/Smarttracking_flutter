import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarttracking/DeleteHPage.dart';
import 'package:smarttracking/ShowHPage.dart';
import 'package:smarttracking/EditPage.dart';

class HealthDataPage extends StatefulWidget {
  @override
  _HealthDataPageState createState() => _HealthDataPageState();
}

class _HealthDataPageState extends State<HealthDataPage> {
  late Future<List<Map<String, dynamic>>> _healthData;

  Future<List<Map<String, dynamic>>> _fetchHealthData() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080//cit2023/list.php'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> parsed = json.decode(response.body);
      return parsed.cast<Map<String, dynamic>>();
    } else {
      throw Exception('ไมส่ ามารถเชอื่ มตอ่ ขอ้มลู ได ้กรณุ าตรวจสอบ');
    }
  }

  @override
  void initState() {
    super.initState();
    _healthData = _fetchHealthData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home_outlined),
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Body Health',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _healthData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('ไม่พบข ้อมูล'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/core.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Body Health',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        columns: <DataColumn>[
                          DataColumn(label: Text(' ')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Surname')),
                          DataColumn(label: Text('Temp.')),
                          DataColumn(label: Text('Search')),
                          DataColumn(label: Text('Edit')),
                          DataColumn(label: Text('Delete')),
                        ],
                        rows: snapshot.data!.map((data) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Image.asset(
                                  'images/profile.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              DataCell(Text(data['firstname'].toString())),
                              DataCell(Text(data['lastname'].toString())),
                              DataCell(Text(data['heart_value'].toString())),
                              DataCell(
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DisplayDataPage(data: data),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    'images/ss.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              DataCell(
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditDataPage(data: data),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    'images/edit.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              DataCell(
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DeleteDataPage(data: data),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    'images/delete1.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HealthDataPage(),
  ));
}
