// import 'package:app/api/api_model.dart';
// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:app/services/dio.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/my_config.dart';
import 'api_user_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<User> getUsers() async {
    const url = "/user/getUserProfile";
    try {
      final res = await Api().get(MyConfig.appUrl + url);
      final data = json.decode(res.data);
      return  User.fromJson(data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

   void updateUserProfile(String name, String email, String password,String bio) async {
    const url = "/user/updateUserProfile";
    var data = {
      "name": name,
     "email": email,
       "password": password,
       "bio": bio,
          };
    try {

      final res = await Api().put(MyConfig.appUrl + url, data: data);
     
      
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

}