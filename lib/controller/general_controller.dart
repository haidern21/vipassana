import 'dart:convert';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
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
  RxDouble repeat=1.00000.obs;
  RxBool sessionLoop= false.obs;
  GoogleSignInAccount? _currentUser;
  RxString pickedFilePath=''.obs;
  RxString userId=''.obs;
  AudioPlayer audioPlayer = AudioPlayer();
  var meditations=[].obs;
  RxBool isUserLoggedIn= false.obs;
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

  var url = Uri.parse('$api/meditation');
  print(url);
  Map body=
    {
      "_id":"${userId}",
      "meditations":
      {
        "dateTime": DateTime.now().toString(),
        "meditationTime": "$meditationTime minutes"
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

    var url = Uri.parse('$api/meditation/${docId}');
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
     isUserLoggedIn.value=await _googleSignIn.isSignedIn();

  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
        _currentUser = account;

    // if (_currentUser != null) {
    //   _googleSignIn.signInSilently();
    // }
  });
     _googleSignIn.signInSilently();

}


  Future<void> handleSignIn() async {
    try {
      var a=await _googleSignIn.signIn();
      log(a!.id.toString());
      userId.value=a.id.toString();
      if(a.id!=''||a.id.isNotEmpty){
      isUserLoggedIn.value=true;}
    } catch (error) {
      log('Error occured: $error');
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();
  checkIfSignedIn() async {
    await googleSignIn();
    if( isUserLoggedIn.value==false){
      // await _handleSignIn();
log('User not signed in ');
    }
    else{
      handleSignIn();
      log('User signed in ');



    }

    // if (user != null) {
    //   log('IF RAN');
    //   log('USER ${user}');
    // }
    //
    // else{
    //   log('Else RAN');
    //
    // }
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
    meditations.value=[];

   try {
     var url = Uri.parse(api + '/meditation/$userId');
     var response = await http.get(url);
     // print('Response status: ${response.statusCode}');
     // print('Response body: ${response.body}');
     var jsonDecoded=jsonDecode(response.body);
   meditations.value= jsonDecoded['meditations'];
   }
   catch (e){
     print("Error occured: ${e.toString()}");

   }
 }
 @override
  void onInit() {
    checkIfSignedIn();
    audioPlayer= AudioPlayer();
    super.onInit();
  }
}