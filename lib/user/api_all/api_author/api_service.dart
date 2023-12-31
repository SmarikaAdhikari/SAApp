// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:app/user/api_all/api_author/api_model.dart';
// import 'package:app/api_book/api_model.dart';
import 'package:app/dio.dart';
import 'package:app/user/utils/my_config.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final autServiceProvider = Provider<AuthorService>((ref) => AuthorService());

// final authorFutureProvider = FutureProvider.autoDispose<List<Authors>>((ref) async {
//   final ApiService = ref.watch(autServiceProvider);
//   return ApiService.getAuthor();
// });

class AuthorService {
  Future<List<Authors>> getAuthor() async {
    const url = "/author/getallauthors";
    try {
      final res = await Api().get(getAppUrl() + url);
      List data = json.decode(res.data);
      return data.map((e) => Authors.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<void> createAuthor(String name, String dob, String bio, String address,
      String description) async {
    const url = "/author/createAuthor";
    var data = {
      "name": name,
      "dob": dob,
      "bio": bio,
      "address": address,
      "description": description,
    };
   
    try {
      final res = await Api().post(getAppUrl() + url, data: data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
