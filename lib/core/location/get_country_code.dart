import 'dart:convert';

import 'package:http/http.dart';
import 'package:spirit_within_flutter/constants/api_paths.dart';

String currentCountryCode;

Future<void> getCountryCode() async {
  Response res = await get(Uri.parse(locationAPI));
  Map data = jsonDecode(res.body);
  currentCountryCode = data['countryCode'];
}
