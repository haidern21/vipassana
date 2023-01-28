import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:vipassana/constants.dart';
class GeneralController extends GetxController{
  RxInt numberOfMinutesIndex=(-1).obs;
  RxInt sessionSoundClipIndex=(-1).obs;
  RxDouble intervalTime=5.0.obs;
  RxDouble leadingTime=5.0.obs;
  RxDouble volume=5.00000.obs;
  RxDouble repeat=5.00000.obs;
  RxBool sessionLoop= false.obs;
  GoogleSignInAccount? _currentUser;
  String _contactText = '';
  var meditations=[].obs;
// signUpWithGoogleFromApiCall() async {
//
//   var url = Uri.http('${api}/auth/google');
//   var response = await http.post(url,);
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//
// }

uploadMeditationToServer({required userId,required meditationTime}) async {
  try{

  var url = Uri.parse(api + '/meditation');
  print(url);
  Map body=
    {
      "_id":"8494655655814581",
      "meditations":
      {
        "dateTime": "${DateTime.now().toString()}",
        "meditationTime": "${meditationTime} minutes"
      }
    };
print(json.encode(body));
  var response = await http.post(url,headers: {"Content-Type": "application/json"},body: json.encode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  }
  catch (e){
    print("ERROR OCCURED : ${e.toString()}");
  }
}
updateMeditations({required docId,required dateTime,required meditationTime}) async {
  try{

    var url = Uri.parse(api + '/meditation/${docId}');
    print(url);
    Map body=
    {
      "_id":"${docId}",
      "meditations":
      {
        "dateTime": "${DateTime.now().toString()}",
        "meditationTime": "${meditationTime} minutes"
      }
    };
    print(json.encode(body));
    var response = await http.post(url,headers: {"Content-Type": "application/json"},body: json.encode(body));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  catch (e){
    print("ERROR OCCURED : ${e.toString()}");
  }
}

  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  googleSignIn() async {
  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
        _currentUser = account;

    // if (_currentUser != null) {
    //   _handleGetContact(_currentUser!);
    // }
  });
  _googleSignIn.signInSilently();
}


  Future<void> _handleSignIn() async {
    try {
      var a=await _googleSignIn.signIn();
      log(a!.id.toString());
    } catch (error) {
      log('Error occured: $error');
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();
  checkIfSignedIn() async {
    await googleSignIn();
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      log('IF RAN');
      log('USER ${user}');
    }
    else{
      log('Else RAN');

      await _handleSignIn();
    }
  }
 getAllMeditaions() async {
  try {
    var url = Uri.parse(api + '/meditation');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  catch (e){
    print("Error occured: ${e.toString()}");

  }
 }
 getUserMeditations({required userId}) async {
   try {
     var url = Uri.parse(api + '/meditation/$userId');
     var response = await http.get(url);
     // print('Response status: ${response.statusCode}');
     // print('Response body: ${response.body}');
     var jsonDecoded=jsonDecode(response.body);
   meditations.value= jsonDecoded['meditations'];
   print(meditations);
   }
   catch (e){
     print("Error occured: ${e.toString()}");

   }
 }
}