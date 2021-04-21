class Users
{
  int userId;
  int id;
  String title;
  String body;

  Users({this.userId, this.id, this.title, this.body});

  Users.fromJson(Map<String,dynamic>json):
        userId=json['userId'],
        id=json['id'],
        title=json['title'],
        body=json['body'];
}
