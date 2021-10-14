import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';


@JsonSerializable()
class User{


  String id;
  String name;
  String email;
  String? token;

  User({required this.id, required this.name, required this.email,this.token=null});


  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        email = data['email'],
        token = null;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}