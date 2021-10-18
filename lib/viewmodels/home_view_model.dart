import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/navigation_service.dart';
import '../services/dialog_service.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
}