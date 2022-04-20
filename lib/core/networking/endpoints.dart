//import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints{
  Endpoints._internal();
  static final Endpoints _instance = Endpoints._internal();

  factory Endpoints()=> _instance;

//static final String _baseUrl = dotenv.env['BASE_URL']!;

}