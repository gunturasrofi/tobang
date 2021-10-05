part of 'models.dart';

class User extends Equatable {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String hp;
  final String group;
  static String? token;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.hp,
    required this.group,
  });

  factory User.formJson(Map<String, dynamic> data) => User(
      id: data['id'],
      firstname: data['firstname'],
      lastname: data['lastname'],
      email: data['email'],
      hp: data['hp'],
      group: data['group']);

  User copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? hp,
    String? group,
  }) =>
      User(
          id: id ?? this.id,
          firstname: firstname ?? this.firstname,
          lastname: lastname ?? this.lastname,
          email: email ?? this.email,
          hp: hp ?? this.hp,
          group: group ?? this.group);

  @override
  List<Object> get props => [id, firstname, lastname, email, hp, group];
}
