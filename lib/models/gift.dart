
import '../constants/config.dart' show IMAGE_SERVER;

import 'gift_contact.dart';

class Gift{

  int id;
  bool hasImage = false;
  String name;
  int userId;
  String? createdAt;
  GiftContact? toContact;
  int? referenceToGroup;


  Gift({
    required this.id,
    required this.name,
    this.toContact,
    this.hasImage = false,
    required this.userId,
    this.createdAt,
    this.referenceToGroup
  });

  factory Gift.fromJson(Map<String, dynamic> data) {

    GiftContact? go;

    if(data.containsKey("toContact") && data["toContact"]!=null && data["toContact"]["name"]!="null") {
      go = GiftContact(id: data["toContact"]["id"].toString(),name: data["toContact"]["name"].toString());
    }

    return Gift(
        id: data['id'] as int,
        name: data['name'] as String,
        toContact: (go!=null)?go:null,
        hasImage: (data.containsKey('withImage')),
        createdAt: data["created_at"],
        referenceToGroup: data["reference_to_group"],
        userId:data["user_id"]
    );
  }

  Map<String, dynamic> _$GiftToJson(Gift instance){

    return <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'reference_to_group': instance.referenceToGroup,
      'toContact':(instance.toContact!=null)?toContact!.toJson():null
    };

  }

  bool isImageGift(){
    return (true==hasImage);
  }

  Map<String, dynamic> toJson() => _$GiftToJson(this);

  String getImagePath(int size) {
    return "$IMAGE_SERVER/$userId/${size}_$id.jpg";
  }



  String getShortName() {
    String str=(toContact!=null)?toContact!.name:name;
    str =  str.trim().split(" ").map((word) => word.substring(0,1).toUpperCase()).toList().join();
    return (str.length>=2)?str.substring(0,2):str.substring(0,1);

  }

}