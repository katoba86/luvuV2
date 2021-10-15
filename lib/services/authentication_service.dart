
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../constants/route_names.dart';
import '../models/user.dart' as base;
import '../locator.dart';
import 'api_service.dart';
import 'navigation_service.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //final FacebookSignIn _facebookSignIn = FacebookSignIn();

  final ApiService _apiService = ApiService();
  final NavigationService _navigationService = locator<NavigationService>();

  base.User? _currentUser;
  base.User? get currentUser => _currentUser;

  Future<bool> isUserLoggedIn() async{
    var user = _firebaseAuth.currentUser;
    if(user == null){return false;}
    await _populateCurrentUser(user);
    return true;
  }





  Future<User?> getUser() async{
    return _firebaseAuth.currentUser;
  }

  Future<LoginResult> _handleFBSignIn() async {


    final LoginResult result = await FacebookAuth.instance.login();

    switch (result.status) {
      case LoginStatus.cancelled:
        print("Cancelled");
        break;
      case LoginStatus.failed:
        print("error");
        break;
      case LoginStatus.success:
        print("Logged In");
        break;
      case LoginStatus.operationInProgress:
        // TODO: Handle this case.
        break;
    }
    return result;
  }

  Future loginWithFacebook() async{
    FacebookAuthCredential? credentials = await _loginWithFacebook();

    return null;
  }

  Future<FacebookAuthCredential?> _loginWithFacebook() async {

      final LoginResult accessToken = await FacebookAuth.instance.login();

    print(accessToken.accessToken!.token);

  }


  Future loginWithGoogle() async{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {




      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      String? token = googleAuth.idToken;
      if(token == null){return false;}
      _currentUser = base.User(name: googleUser.displayName!,id: googleUser.id,token: token,email: googleUser.email);
      if(_currentUser!=null) {
        await _apiService.createUser(currentUser!);
      }
    }else{
      print("Aborted");
    }


  }



  _populateCurrentUser(User user) async{
    if(user != null){
      IdTokenResult token = await user.getIdTokenResult();
      _currentUser = new base.User(name: user.displayName!,id: user.uid,token: token.token,email: user.email!);
    }
  }

  void logOut() async{

    await _firebaseAuth.signOut();
    _currentUser = null;
    _navigationService.replaceTo(LoginViewRoute);
  }

}