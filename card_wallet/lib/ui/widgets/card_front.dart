import 'package:flutter/material.dart';
import '../../helpers/card_colors.dart';
import '../widgets/card_chip.dart';
import '../../blocs/card_bloc.dart';
import '../../blocs//bloc_provider.dart';


class CardFront extends StatelessWidget{

  final int rotatedTrunsValue;
  CardFront({this.rotatedTrunsValue});

  @override
  Widget build(BuildContext context){
    final CardBloc bloc=BlocProvider.of<CardBloc>(context);

    final _cardNumber =Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          StreamBuilder<String>(
            stream: bloc.cardNumber,
            builder: (context, snapshot){
              return snapshot.hasData
                ? _formatCardNumber(snapshot.data)
                : _formatCardNumber('0000000000000000');
            },
          ),
        ],
      ),
    );

    final _cardLastNumber = Padding(
      padding: const EdgeInsets.only(top: 1.0, left: 44.0),
      child: StreamBuilder<String>(
        stream: bloc.cardNumber,
        builder: (context, snapshot){
          return Text(
            snapshot.hasData && snapshot.data.length >= 15
              ? snapshot.data
                  .replaceAll(RegExp(r'\s+\b|\b\s'), '')
                  .substring(12)
              : '0000',
            style: TextStyle(color: Colors.white,fontSize: 8.0),
          );
        },
        ),
    );

     final _cardValidThru = Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'valid',
                style: TextStyle(color: Colors.white, fontSize: 8.0),
              ),
              Text(
                'thru',
                style: TextStyle(color: Colors.white, fontSize: 8.0),
              )
            ],
          ),
          SizedBox(
            width: 5.0,
          ),
          StreamBuilder(
            stream: bloc.cardMonth,
            builder: (context, snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data : '00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              );
            },
          ),
          StreamBuilder<String>(
              stream: bloc.cardYear,
              builder: (context, snapshot) {
                return Text(
                  snapshot.hasData && snapshot.data.length > 2
                      ? '/${snapshot.data.substring(2)}'
                      : '/00',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                );
              })
        ],
      ),
    );

    return null;
  }

  Widget _formatCardNumber(String cardNumber){
    cardNumber =cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
    List<Widget> numberList = new List<Widget>();
    var counter = 0;
    for (var i = 0; i<cardNumber.length; i++){
      counter += 1;
      numberList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Text(
            cardNumber[i],
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
      if (counter == 4){
        counter = 0;
        numberList.add(SizedBox(width: 26.0));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numberList,
    );
  }
}