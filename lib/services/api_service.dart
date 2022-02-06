import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Iterable> fetchData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Iterable dataBody = json.decode(response.body);
    return dataBody;
  } else if (response.statusCode == 400) {
    throw Exception('Failed to load task list');
  } else {
    throw Exception('Network Error');
  }
}
