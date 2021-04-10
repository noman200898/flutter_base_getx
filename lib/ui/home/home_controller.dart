import 'dart:developer';

import 'package:base_application/data/repositories/repository.dart';
import 'package:base_application/ui/home/home_states.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var counter = 0.obs;
  var homeState = Rx<HomeState>(HomeLoadingState());
  final Repository repository;

  HomeController({required this.repository}){
    getMessage();
  }

  void getMessage() async{
    try{
      var response = await repository.getMessage();
      if (response.success!=null  && response.success!) {
        homeState.value = HomeLoadedState(response);
      } else {
        var e = Exception(response.message);

        if(response.message!=null)
          log(response.message!);
        homeState.value = HomeErrorState();
      }
    }catch(e){
      homeState.value = HomeErrorState();
      log(e.toString());
    }
  }

}