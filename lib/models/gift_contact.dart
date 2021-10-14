class GiftContact{
  String name;
  String id;
  String? phones;


  GiftContact({
    required this.id,
    required this.name,
    this.phones,
  });


  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'phones':phones
  };

}