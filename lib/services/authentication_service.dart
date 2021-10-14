
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

    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;


    final AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
    final UserCredential authResult = await _firebaseAuth.signInWithCredential(credential);
    final User? user = authResult.user;

    await _populateCurrentUser(user!);
    await _apiService.createUser(currentUser!);

    return user!=null;
  }




  _populateCurrentUser(User user) async{
    IdTokenResult token = (await user.getIdToken()) as IdTokenResult;
    _currentUser = base.User(name: user.displayName!,id: user.uid,token: token.token,email: user.email!);
  }

  void logOut() async{

    await _firebaseAuth.signOut();
    _currentUser = null;
    _navigationService.replaceTo(LoginViewRoute);
  }

}