
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../utils/utils.dart';
import 'app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic responseJson;
    print('Url is ->> $url');

    // String? mtoken = await Utils.instance.getToken();

    http.Response response;

    try {
      response = await http.get(Uri.parse(url), headers: {
        // if (mtoken != null) 'Authorization': 'Token $mtoken',
      }).timeout(const Duration(seconds: 60));

      print(response.statusCode);
      responseJson = returnResponse(response);


    } on SocketException {
      throw InternetException("No InterNet");
    } on RequestTimeOut {
      throw TimeoutException("Time Out");
    } on Error {
      throw ServerException('');
    } catch (e) {
      throw ServerException('');
    }


    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidUrlException("Invalid Url Exception");
      case 404:
        throw InvalidUrlException("Invalid Url Exception");

      default:
        throw FetchDataException("");
    }
  }

  @override
  Future postApi(data, String url) async {
    dynamic jsonResponse;
    print("url is ----------$url");
    print("data is ----------$data");
    // String? mtoken = await Utils.instance.getToken();


    http.Response response;
    try {


      response = await http
          .post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: jsonEncode(data))
          .timeout(const Duration(seconds: 60));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }

    return jsonResponse;
  }

  @override
  Future put2Api(data, String url) async {
    print("App url is --> $url");
    print("App Data is --> $data");
    dynamic jsonResponse;

    // String? mtoken = await Utils.instance.getToken();

    http.Response response;
    final headers = {
      'Authorization': 'Bearer ',
      'Content-Type': 'application/json',

    };
    try {
      response = await http.put(Uri.parse(url), headers: headers, body: jsonEncode(data)).timeout(const Duration(seconds: 60));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }

    return jsonResponse;
  }

  @override
  Future putApi(String url) async {
    dynamic responseJson;
    print('Url is ->> $url');
    String mtoken = '';


    http.Response response;

    try {
      if (mtoken == '') {
        response =
        await http.put(Uri.parse(url)).timeout(const Duration(seconds: 60));
      } else {
        response = await http.put(Uri.parse(url), headers: {
          'Authorization': 'Bearer $mtoken', // Set the content type to J7SON
        }).timeout(const Duration(seconds: 60));
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("No InterNet");
    } on RequestTimeOut {
      throw TimeoutException("Time Out");
    } on Error {
      throw ServerException('');
    } catch (e) {
      throw ServerException('');
    }



    return responseJson;
  }

  @override
  Future deleteApi(String url) async {
    print("my uel ***>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<**** $url");
    dynamic responseJson;

    String mtoken = '';


    http.Response response;

    try {
      if (mtoken == '') {
        response =
        await http.delete(Uri.parse(url)).timeout(const Duration(seconds: 60));
      } else {
        response = await http.delete(Uri.parse(url), headers: {
          'Authorization': 'Bearer $mtoken', // Set the content type to J7SON
        }).timeout(const Duration(seconds: 60));
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("No InterNet");
    } on RequestTimeOut {
      throw TimeoutException("Time Out");
    } on Error {
      throw ServerException('');
    } catch (e) {
      throw ServerException('');
    }
    return responseJson;
  }


  @override
  Future postMultipartApi(data, String image, String url) async {
    print("my url is $url $data $image");
    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);


    data.forEach((key, value) {
      request.fields[key] = value;
    });

    if (image.isNotEmpty) {
      var imageFile = await http.MultipartFile.fromPath('profile_image', image);
      request.files.add(imageFile);
    }

    var response = await request.send();

    switch (response.statusCode) {
      case 200:
        dynamic responseJson =
            jsonDecode(await response.stream.bytesToString());
        return responseJson;

      case 400:
        throw InvalidUrlException("Invalid Url Exception");

      default:
        throw FetchDataException("${response.statusCode}");
    }
  }

  @override
  Future postMultipartApi1(data, List<String> outerimg, List<String> innerimg, String url) async {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);


    data.forEach((key, value) {
      request.fields[key] = value;
    });


    for (var imagePath in outerimg) {
      if (imagePath.isNotEmpty) {
        var imageFile = await http.MultipartFile.fromPath('outer_car_images', imagePath);
        request.files.add(imageFile);
      }
    }

    for (var imagePath in innerimg) {
      if (imagePath.isNotEmpty) {
        var imageFile = await http.MultipartFile.fromPath('inner_car_images', imagePath);
        request.files.add(imageFile);
      }
    }

    var response = await request.send();

    switch (response.statusCode) {
      case 200:
        dynamic responseJson =
        jsonDecode(await response.stream.bytesToString());
        return responseJson;

      case 400:
        throw InvalidUrlException("Invalid Url Exception");

      default:
        throw FetchDataException("${response.statusCode}");
    }
  }

  @override
  Future putMultipartApi(data, String image, String url) async {
    print("my url is $url $data $image");
    var uri = Uri.parse(url);
    var request = http.MultipartRequest('PUT', uri);




    data.forEach((key, value) {
      request.fields[key] = value;
    });

    if (image.isNotEmpty) {
      var imageFile = await http.MultipartFile.fromPath('profile', image);
      request.files.add(imageFile);
    }

    var response = await request.send();

    switch (response.statusCode) {
      case 200:
        dynamic responseJson =
        jsonDecode(await response.stream.bytesToString());
        return responseJson;

      case 400:
        throw InvalidUrlException("Invalid Url Exception");

      default:
        throw FetchDataException("${response.statusCode}");
    }
  }





  @override
  Future addProductMultipart(
      data, List<String> imglist, String url) async {

    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);



   await data.forEach((key, value) async {
      request.fields[key] = value;
    });

   var imgKey = 'productImage';

   for (int i=0;i<imglist.length;i++) {
     var imageFile = await http.MultipartFile.fromPath('$imgKey${i+1}', imglist[i]);
     request.files.add(imageFile);
   }

    var response = await request.send();

    switch (response.statusCode) {
      case 200:
        dynamic responseJson =
            jsonDecode(await response.stream.bytesToString());
        return responseJson;

      case 400:
        throw InvalidUrlException("Invalid Url Exception");

      default:
        throw FetchDataException("");
    }
  }




  @override
  Future patchApi(var data,String url) async {
    print("patch url *******$url");
    print("patch url *******$data");
    dynamic responseJson;
    String mtoken = '';

    http.Response response;

    try {

      // String? mtoken = await Utils.instance.getToken();
      response = await http.patch(Uri.parse(url),body: jsonEncode(data), headers: {
        'Authorization': 'Token ',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }).timeout(const Duration(seconds: 60));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("No InterNet");
    } on RequestTimeOut {
      throw TimeoutException("Time Out");
    } on Error {
      throw ServerException('');
    } catch (e) {
      throw ServerException('');
    }

    return responseJson;
  }
}
