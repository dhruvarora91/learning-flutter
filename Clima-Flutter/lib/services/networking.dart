import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
//      var temp = decodedData['main']['temp'];
//      var condition = decodedData['weather'][0]['id'];
//      var cityName = decodedData['name'];
    } else {
      print('error : $response.statusCode');
    }
  }
}
