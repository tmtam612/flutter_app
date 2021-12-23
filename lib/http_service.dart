import 'dart:convert';

import 'Email.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<Email>> fetchEmail() async {
    final response = await http
        .get(Uri.parse('https://61c42e42f1af4a0017d993b7.mockapi.io/Email'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Email> emails =
          body.map((dynamic item) => Email.fromJson(item)).toList();
      return emails;
    } else {
      throw Exception('Failed to load');
    }
  }
}
