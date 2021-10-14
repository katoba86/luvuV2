import '../locator.dart';
import '../services/authentication_service.dart';
import '../services/navigation_service.dart';
import '../services/dialog_service.dart';

import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();


  Future signUpWithFacebook() async{
    setBusy(true);

    var result = await _authenticationService.loginWithFacebook();

    await _dialogService.showDialog(
      title: 'Sign Up Failure',
      description: "Klappt nicht...",
    );

    setBusy(false);
    if (result is bool) {
      if (result) {
        // @todo here we go
       // _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: "Klappt nicht...",
      );
    }
  }

  Future signUpWithGoogle() async {
    setBusy(true);

    var result = await _authenticationService.loginWithGoogle();

    setBusy(false);

    if (result is bool) {
      if (result) {
        //here we go
        //_navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}