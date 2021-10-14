
class Lists{
  int id;
  String name;
  bool allUsersCanPost = false;
  bool allUsersCanInvite = false;
  String? createdAt;
  String? updatedAt;


  Lists({
    required this.id,
    required this.name,
    this.allUsersCanPost = false,
    this.allUsersCanInvite = false,
    this.createdAt,
    this.updatedAt
  });


  factory Lists.fromJson(Map<String, dynamic> json) => _$ListsFromJson(json);
  Map<String, dynamic> toJson() => _$ListsToJson(this);

  String getShortName() {

    String str =  name.trim().split(" ").map((word) => word.substring(0,1).toUpperCase()).toList().join();
    return (str.length>=2)?str.substring(0,2):str.substring(0,1);

  }





}

Lists _$ListsFromJson(Map<String, dynamic> json) {
  return Lists(
    id: json['id'] as int,
    name: json['name'] as String,
    allUsersCanPost: (json['alluserscan_post']==0)?false:true,
    allUsersCanInvite: (json['all_users_can_invite']==0)?false:true,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$ListsToJson(Lists instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'allUsersCanPost': instance.allUsersCanPost,
  'allUsersCanIncite': instance.allUsersCanInvite,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};