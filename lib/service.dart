import 'package:counter_app/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Service {
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  static Future<List<User>> getInfo() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        Fluttertoast.showToast(msg: "Error Massage: Please try again");
        return <User>[];
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
      return <User>[];
    }
  }
}
