class Patient {
  final int userId;
  final int id;
  final String title;
  final String body;

  Patient(this.userId, this.id,this.title,this.body);

  Patient.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title=json['title'],
        body=json['body'];

  Map<String, dynamic> toJson() =>
      {
        'userId': userId,
        'id': id,
        'title':'title',
        'body':'body'
      };
}
