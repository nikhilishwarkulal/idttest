import 'package:dio/dio.dart';

String _kBaseUrl = "";

///[CustomDio] A abstraction class
abstract class CustomDio {
  Future<String> callApi({String? customUrl});
}

///[CustomDioImpl] A implementation of abstraction class
class CustomDioImpl implements CustomDio {
  ///[CustomDioImpl] constructer wich takes optional value [Dio] and
  ///[String] base url if none is defined a default base url will be taken.
  CustomDioImpl({Dio? dioInject, String? baseUrl}) {
    if (dioInject == null) {
      dio = Dio();
    } else {
      dio = dioInject;
    }
    if (baseUrl == null) {
      apiUrl = _kBaseUrl;
    } else {
      apiUrl = baseUrl;
    }
  }
  late String apiUrl;
  late Dio dio;

  ///[callApi] will make a network call through internet and
  ///[String] returns a response in string format
  ///[customUrl] can be passed at the time of api call.
  ///if not passed  url will be taken from constructor.
  @override
  Future<String> callApi({String? customUrl}) async {
    try {
      var response = await dio.get(
        customUrl ?? apiUrl,
        options: Options(
          responseType: ResponseType.plain,
        ),
      );
      String result = response.data.toString();

      ///TODO : Comment or Uncomment Below line
      result = replaceCommaToAvoidError(result);

      ///Return a json in string format
      return result;
    } catch (ex) {
      rethrow;
    }
  }

  ///[wrongJson] wrong json is given to user.
  ///This will auto correct the json.
  String replaceCommaToAvoidError(String wrongJson) {
    return wrongJson.replaceAll("},]", "}]");
  }
}
