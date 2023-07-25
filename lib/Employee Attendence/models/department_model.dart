class DepartmentModel {
  final int id;
  final String title;

  DepartmentModel({required this.id, required this.title});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
