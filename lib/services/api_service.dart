
import 'dart:convert';
import 'dart:io';


import '../models/lists.dart';
import '../models/user.dart';
import '../models/gift.dart';
import 'API/dio_provider.dart';
import 'API/gift_service.dart';
import 'API/list_service.dart';
import 'API/user_service.dart';



class ApiService{


  Future<User> createUser(User u){

    return UserService(
        DioProvider.withAuth(u).getDio()
    ).getUser();

  }

  Future<Gift> updateGift(Map<String,String> editingList,int giftId,User u,{File? file}){
    return  GiftService(
        DioProvider.withAuth(u).getDio()
    ).updateGift(giftId,json.encode(editingList),file:file);
  }
  Future<void> deleteGift(Gift gift,User u) async{
    await  GiftService(
        DioProvider.withAuth(u).getDio()
    ).delete(gift.id);
  }

  Future<Gift> addGift(Gift gift,User u,{File? file}){

    return  GiftService(
        DioProvider.withAuth(u).getDio()
    ).addGift(gift,file: file);
  }


  Future <List<Gift>> getListGifts(Lists list,User u) async{
    List<Gift> gifts =  await  new GiftService(
        DioProvider.withAuth(u).getDio()
    ).getGiftList();
    return gifts.where((Gift item){
      return (item.referenceToGroup == list.id);
    }).toList();
  }

  Future <List<Gift>> getGifts(User u) async{

    List<Gift> gifts = await  new GiftService(
        DioProvider.withAuth(u).getDio()
    ).getGiftList();
    return gifts.where((Gift item){
      return (item.referenceToGroup == null);
      //return item.reference_to_group = list.id;
    }).toList();
  }
  Future <List<Lists>> getLists(User u){

    return  ListService(
        DioProvider.withAuth(u).getDio()
    ).getLists();
  }

}