import 'package:get/get.dart';

class GeneralController extends GetxController{
  RxInt numberOfMinutesIndex=(-1).obs;
  RxInt sessionSoundClipIndex=(-1).obs;
  RxDouble intervalTime=5.0.obs;
  RxDouble leadingTime=5.0.obs;
  RxDouble volume=5.00000.obs;
  RxDouble repeat=5.00000.obs;
  RxBool sessionLoop= false.obs;
}