import 'package:luvu_v2/services/crud.dart';

import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/navigation_service.dart';
import '../services/dialog_service.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();



  test(){
    Crud c = new Crud();
    var data = c.getData(this._authenticationService.currentUser!.id);

  }
}