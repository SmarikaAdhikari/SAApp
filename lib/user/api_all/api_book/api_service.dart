// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:app/user/api_all/api_book/book_model.dart';
import 'package:app/user/api_all/api_cart/api_model.dart';
import 'package:app/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import '../../utils/my_config.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<BookModel>> getBooks() async {
    const url = "/book/getallbooks";
    try {
      final res = await Api().get(getAppUrl() + url);
      List data = json.decode(res.data);
      return data.map((e) => BookModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<void> addFavorite(String bookId) async {
    const url = "/favorite/createFavorite";
    var data = {
      "bookId": bookId,
    };
    try {
      final res = await Api().post(getAppUrl() + url, data: data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<BookDetailModel> getBooksById(String bookId) async {
    final url = "/book/getBookById/$bookId";

    try {
      final res = await Api().get(getAppUrl() + url);
      // print(res.statusCode);
      final data = json.decode(res.data);
      // print(data);

      return BookDetailModel.fromJson(data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<List<FavModel>> getAllFavorites() async {
    const url = "/favorite/getAllFavorites";

    try {
      final res = await Api().get(getAppUrl() + url);
      // print(res.statusCode);
      List data = json.decode(res.data);
      return data.map((e) => FavModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<List<FavModel>> getAllReading() async {
    const url = "/reading/getAllReading";
    try {
      final res = await Api().get(getAppUrl() + url);
      List data = json.decode(res.data);

      return data.map((e) => FavModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<void> addReadingList(String bookId) async {
    const url = "/reading/createReading";
    var data = {
      "bookId": bookId,
    };
    try {
      final res = await Api().post(getAppUrl() + url, data: data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<List<CartModel>> getAllCart() async {
    const url = "/cart/getAllCart";

    try {
      final res = await Api().get(getAppUrl() + url);
      List datas = json.decode(res.data);

      final returnData = datas.map((e) => CartModel.fromJson(e)).toList();

      return returnData;
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<void> addCartList(String bookId) async {
    const url = "/cart/addToCart";
    var data = {
      "bookId": bookId,
    };
    try {
      final res = await Api().post(getAppUrl() + url, data: data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future<void> createBook(
      String title,
      String author,
      String description,
      String genre,
      dynamic image,
      String price,
      String releasedate,
      String length,
      String language) async {
    const url = "/book/createBook";
    var data = FormData.fromMap({
      "title": title,
      "authorId": author,
      "description": description,
      "genre": genre,
      "file": image == null ? null: await MultipartFile.fromFile(image.path),
      "price": price,
      "releasedAt": releasedate,
      "length": length,
      "language": language,
    });
    // print(data);
    try {
      final res = await Api().post(getAppUrl() + url, data: data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
