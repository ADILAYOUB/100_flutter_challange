class AttendanceModel {
  final String id;
  final String date;
  final String checkIn;
  final String? checkOut;
  final DateTime createdAt;

  AttendanceModel({
    required this.id,
    required this.date,
    required this.checkIn,
    this.checkOut,
    required this.createdAt,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> data) {
    return AttendanceModel(
      id: data['id'].toString(),
      date: data['date'],
      checkIn: data['check_in'],
      checkOut: data['check_out'],
      createdAt: DateTime.parse(data['created_at']),
    );
  }
}
