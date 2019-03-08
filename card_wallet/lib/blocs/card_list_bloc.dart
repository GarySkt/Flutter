import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/card_model.dart';
import 'dart:convert';
import '../helpers/card_colors.dart';

class CardListBloc {
  //primero crear controller
  //maneja la lista de card results
  BehaviorSubject<List<CardResults>> _cardCollection =BehaviorSubject<List<CardResults>>();

  //manipular lista de tarjetas

  List<CardResults> _cardResults;

  //recuperar datos del stream
  Stream<List<CardResults>> get cardList => _cardCollection.stream;

  //lee archivo json e inserta la informacion
  void initialData()   async{
    var initialData =await rootBundle.loadString('data/InitialData.json');//cargar archivo json
    var decodedJson =jsonDecode(initialData); //decodifica json
    _cardResults =CardModel.fromJson(decodedJson).results; //devuelve la lista de results
    //iterar color para cada tarjeta
    for (var i = 0; i < _cardResults.length; i++) {
      _cardResults[i].cardColor =CardColor.baseColor[i];
    }

    _cardCollection.sink.add(_cardResults);
  }

  CardListBloc(){
    //carga los datos
    initialData();
  }

  void addCardToList(CardResults newCard){
    _cardResults.add(newCard);
    _cardCollection.sink.add(_cardResults);
  }

  void dispose(){
    _cardCollection.close();
  }
}

final cardListBloc =CardListBloc();