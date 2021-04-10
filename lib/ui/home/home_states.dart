import 'package:base_application/data/models/message_response.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{}

class HomeLoadingState extends HomeState{
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState{

  final MessageResponse response;

  HomeLoadedState(this.response);

  @override
  List<Object> get props => [response];
}

class HomeErrorState extends HomeState{

 /* final Exception e;

  HomeErrorState(this.e);*/

  @override
  List<Object> get props => [];
}