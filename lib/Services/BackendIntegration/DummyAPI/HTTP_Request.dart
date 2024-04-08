import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'Dummyapi_Model.dart';

GetDummyapiModel getDummyapiModel = GetDummyapiModel();

Future<void> fetchDataAllUser() async {
  var dio = Dio();
  dio.options.headers['app-id'] = getDummyapiModel.apiKey;

  try {
    getDummyapiModel.responseAllUser = await dio.get('https://dummyapi.io/data/v1/user/');
    print('Data User: ${getDummyapiModel.responseAllUser}');
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

Future<List<dynamic>> getDataAllUser() async {
  try {
    await fetchDataAllUser();
    if (getDummyapiModel.responseAllUser.data['data'] is List<dynamic>) {
      return getDummyapiModel.responseAllUser.data['data'];
    } else {
      throw Exception('Data is not a list');
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    rethrow;
  }
}

Future<void> fetchDataAllPosts() async {
  var dio = Dio();
  dio.options.headers['app-id'] = getDummyapiModel.apiKey;

  try {
    getDummyapiModel.responseAllPosts = await dio.get('https://dummyapi.io/data/v1/post/');
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

Future<List<dynamic>> getDataAllPosts() async {
  try {
    await fetchDataAllPosts();
    if (getDummyapiModel.responseAllPosts.data['data'] is List<dynamic>) {
      return getDummyapiModel.responseAllPosts.data['data'];
    } else {
      throw Exception('Data is not a list');
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    rethrow;
  }
}
