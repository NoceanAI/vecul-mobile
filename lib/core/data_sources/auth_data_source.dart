import 'package:vecul/core/locator.dart';
import 'package:vecul/core/networking/endpoints.dart';
import 'package:vecul/core/networking/network_helper.dart';

class AuthDataSource{
  final Endpoints _endpoints = Endpoints();
  final NetworkHelper _networkHelper = locator<NetworkHelper>();
}