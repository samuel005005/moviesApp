import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String movieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'The key is not configured';
  static String movieDbUrl =
      dotenv.env['THE_MOVIEDB_URL'] ?? 'The url is not configured';
  static String movieDbLan =
      dotenv.env['THE_MOVIEDB_LANGUAGE'] ?? 'The language is not configured';
}
