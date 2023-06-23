import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../services/database_service.dart';

class EmpProfileScreen extends StatefulWidget {
  const EmpProfileScreen({super.key});

  @override
  State<EmpProfileScreen> createState() => _EmpProfileScreenState();
}

class _EmpProfileScreenState extends State<EmpProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dbservice = Provider.of<DatabaseService>(context);

    return Scaffold(
      body: dbservice.userModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      child: const Center(
                        child: Icon(
                          IconlyLight.profile,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Employee ID: ${dbservice.userModel!.employeeId}',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Employee Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    dbservice.alldepartments.isEmpty
                        ? const LinearProgressIndicator()
                        : SizedBox(
                            height: double.infinity,
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Department',
                                  border: OutlineInputBorder()),
                              value: dbservice.employeeDepartment ??
                                  dbservice.alldepartments.first.id,
                              items: dbservice.alldepartments.map((e) {
                                return DropdownMenuItem(
                                  value: e.id,
                                  child: Text(e.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                      )),
                                );
                              }).toList(),
                              onChanged: (selectedValue) {
                                dbservice.employeeDepartment = selectedValue;
                              },
                            ),
                          ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          dbservice.updateProfile(
                              _nameController.text, context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Update'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
