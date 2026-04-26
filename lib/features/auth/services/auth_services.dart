import 'package:avais_store/features/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class AuthServices{
  List<User> users = [];
Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('http://192.168.0.43:3000/api/users'));

    if (response.statusCode == 200) {
      final List<dynamic> parsedusers = json.decode(response.body);
      
        users = parsedusers
            .map((jsonProduct) => User.fromJson(jsonProduct))
            .toList();

        

    

    }
}

}