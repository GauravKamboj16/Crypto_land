import 'dart:convert';
import 'dart:developer';

import 'package:crypto_land/Models/CryptoModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
class HomeController extends GetxController{
  var isDataLoading = false.obs;
  CryptoModel? crypto_model;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getApi();
  }

  Future<void> getApi() async {
    isDataLoading(true);
    try {
      Uri uri = Uri.parse("https://coinranking1.p.rapidapi.com/coins");
      var response = await get(uri, headers: {
        'X-RapidAPI-Key': '9054473f12msh8875d641d62ad6ap1e1960jsn2879302db718',
        'X-RapidAPI-Host': 'coinranking1.p.rapidapi.com'
      });


      if (response.statusCode == 200) {
        print(response.statusCode.toString() + "gourav");
        var result = jsonDecode(response.body);

       crypto_model = CryptoModel.fromJson(result);
      }
      else {

      }
    }

    catch (e) {
      log('error $e');
    }
    finally {
      isDataLoading(false);
    }
  }
}