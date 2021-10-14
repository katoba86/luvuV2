
import 'package:luvu_v2/constants/route_names.dart';

import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/navigation_service.dart';

import 'base_model.dart';

class StartUpViewModel extends BaseModel{

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();



  Future handleStartupLogic() async{
      var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

      _navigationService.replaceTo(
        //(hasLoggedInUser)?HomeViewRoute:LoginViewRoute
        LoginViewRoute
      );
  
  }

}