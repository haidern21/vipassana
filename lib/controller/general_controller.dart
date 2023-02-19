import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:vipassana/constants.dart';
import 'package:vipassana/shared_pref.dart';
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
  RxInt totalTimer=0.obs;
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
  SharedPrefs sharedPrefs= SharedPrefs();
  uploadMailingToServer({required email,required name}) async {
    try{

      var url = Uri.parse('$api/mailing');
      print(url);
      Map body=

      {
        "email": email,
        "name": name

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
  uploadFeedbackToServer({required email,required feedback}) async {
    try{

      var url = Uri.parse('$api/feedback');
      print(url);
      Map body=

      {
        "email": email,
        "comment": feedback

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
  updateMeditations({required docId,required meditationTime}) async {
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

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId

    // clientId: '373766077119-8puntccjnp3fuigdre7agdrnevh8jnha.apps.googleusercontent.com ',
    scopes: <String>[
      'email',
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final GoogleSignIn _googleSignInIos = GoogleSignIn(
    // Optional clientId

    clientId: '373766077119-8puntccjnp3fuigdre7agdrnevh8jnha.apps.googleusercontent.com ',
    scopes: <String>[
      'email',
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  googleSignIn() async {
    if(Platform.isAndroid) {
      isUserLoggedIn.value = await _googleSignIn.isSignedIn();
      _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
        _currentUser = account;

        // if (_currentUser != null) {
        //   _googleSignIn.signInSilently();
        // }
      });
      _googleSignIn.signInSilently();
    }
    else{
      isUserLoggedIn.value = await _googleSignInIos.isSignedIn();
      _googleSignInIos.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
        _currentUser = account;



        // if (_currentUser != null) {
        //   _googleSignIn.signInSilently();
        // }
      });
      _googleSignInIos.signInSilently();
    }


  }

  checkIfUserExistsInDb({required userId}) async {
    var response;
    try{
      var url = Uri.parse(api + '/meditation/$userId');
      response = await http.get(url);


    }
    catch (e){
      print("Error occured: ${e.toString()}");

    }
    return response.statusCode;
  }
  Future<void> handleSignIn() async {
    var a ;
    try {
      if(Platform.isAndroid) {
        a=await _googleSignIn.signIn();
      }
      else{
        a=await _googleSignInIos.signIn();
      }
      log(a!.id.toString());
      userId.value=a.id.toString();
      if(a.id!=''||a.id.isNotEmpty){
        isUserLoggedIn.value=true;}
    } catch (error) {
      Get.snackbar('Error', 'Some error occurred while signing in, please try again later !!!',snackPosition: SnackPosition.BOTTOM,colorText: Colors.red);
      log('Error occured: $error');
    }
  }

  Future<void> handleSignOut() {

    if(Platform.isAndroid) {
      return _googleSignIn.disconnect();
    }
    else{
      return _googleSignInIos.disconnect();
    }

  }
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
      print('Response body: ${jsonDecoded}');
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
    audioPlayer.setVolume(0.5);
    getInitialData();
    super.onInit();
  }
  getInitialData()async{
    int? sessionValue= await sharedPrefs.getSaveSessionSoundClipIndex();
    int? rept= await sharedPrefs.getIntervalValue();
    if(sessionValue!=null){
      sessionSoundClipIndex.value=sessionValue;
    }
    if(rept!=null){
      repeat.value=rept.toDouble();
    }
  }
}