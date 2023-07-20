class UserModel {
  final String id;
  final String name;
  final String email;
  final String employeeId; // unique emp id
  final int? department; // foreign key

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.employeeId,
    this.department,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      employeeId: data['employee_id'],
      department: data['department'],
    );
  }
}
