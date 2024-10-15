import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_project/screen/model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<List<Departments>> loadJson() async {
  //   final String response = await rootBundle.loadString('assets/data2.json');
  //   Map<String, dynamic> data = json.decode(response);
  //   final List result = data['departments'];
  //   return result.map((i) => Departments.fromJson(i)).toList();
  // }

  Future<UserModel> loadJson() async {
    final String response = await rootBundle.loadString('assets/data2.json');
    final data = await json.decode(response);
    return UserModel.fromJson(data);
  }

  @override
  void initState() {
    loadJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nasted Json File'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: loadJson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return ListView.builder(
            itemCount: snapshot.data?.organization?.departments?.length,
            itemBuilder: (context, index) {
              final data = snapshot.data?.organization?.departments?[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 22),
                color: Colors.blue.withOpacity(0.3),
                child: ListTile(
                  title: const Text(
                    "Organization",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${snapshot.data?.organization?.name}"),
                      Text(
                          "Found Year: ${snapshot.data?.organization?.froundedYear}"),
                      const Text(
                        "Departments",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("Department ID: ${data?.departmentId}"),
                      Text("Name: ${data?.name}"),
                      const Text(
                        "Manager",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("ID: ${data?.manager?.id}"),
                      Text("Name: ${data?.manager?.name}"),
                      Text("Email: ${data?.manager?.email}"),
                      Text("Phone: ${data?.manager?.phone}"),
                      Text("Position: ${data?.manager?.position}"),
                      const Text(
                        "Employees",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("Employee ID: ${data?.employee?[0].employeeId}"),
                      Text("Name: ${data?.employee?[0].name}"),
                      Text("Email: ${data?.employee?[0].email}"),
                      Text("Position: ${data?.employee?[0].position}"),
                      const Text(
                        "Salary",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("Amount: ${data?.employee?[0].salary?.amount} ${data?.employee?[0].salary?.currency} ${data?.employee?[0].salary?.paySchedule}"),
                      const Text(
                        "Contact Info",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text("Street: ${data?.employee?[0].contactInfo?.address?.street}"),
                      Text("City: ${data?.employee?[0].contactInfo?.address?.city}"),
                      Text("State: ${data?.employee?[0].contactInfo?.address?.state}"),
                      Text("Postal Code: ${data?.employee?[0].contactInfo?.address?.pastalCode}"),
                      const Text(
                        "Phone",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text("Phone Number: ${data?.employee?[0].contactInfo?.phone}"),
                      const Text(
                        "Emergency Contact",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text("Name: ${data?.employee?[0].contactInfo?.emergency?.name}"),
                      Text("RelationShip: ${data?.employee?[0].contactInfo?.emergency?.relation}"),
                      Text("Phone: ${data?.employee?[0].contactInfo?.emergency?.phone}"),
                      const Text(
                        "Projects",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("ID: ${data?.employee?[0].project?[index].projectId}"),
                      Text("Name: ${data?.employee?[0].project?[index].name}"),
                      Text("Description: ${data?.employee?[0].project?[index].description}"),
                      const Text(
                        "Taks1",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Text("ID: ${data?.employee?[0].project?[index].task?[0].taskId}"),
                      Text("Description: ${data?.employee?[0].project?[index].task?[0].description}"),
                      Text("Assigned To: ${data?.employee?[0].project?[index].task?[0].assignedTo}"),
                      Text("Status: ${data?.employee?[0].project?[index].task?[0].status}"),
                      Text("Deadline: ${data?.employee?[0].project?[index].task?[0].deadline}"),
                      const Text(
                        "Taks2",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Text("ID: ${data?.employee?[0].project?[index].task?[1].taskId}"),
                      Text("Description: ${data?.employee?[0].project?[index].task?[1].description}"),
                      Text("Assigned To: ${data?.employee?[0].project?[index].task?[1].assignedTo}"),
                      Text("Status: ${data?.employee?[0].project?[index].task?[1].status}"),
                      Text("Deadline: ${data?.employee?[0].project?[index].task?[1].deadline}"),
                       const Text(
                        "Date",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("Joing Date: ${data?.employee?[0].joinDate}"),
                      const Text(
                        "Health",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("Blood Group: ${data?.employee?[0].health?.blood}"),
                      Text("Condition: ${data?.employee?[0].health?.known}")
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
