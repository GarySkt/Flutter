import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
       title: 'Bienvenido',
      home: RandomWords(),     
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return RandomWordsState();
  }  
}
class RandomWordsState extends State<RandomWords>{
  final _suggestion = <WordPair>[];
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Bievenido a flutter'),
        ),
        body: _buildSuggestions(),
       
      );

  }
  Widget _buildSuggestions(){
    return ListView.builder(
      itemBuilder: (context, i){
        if(i >= _suggestion.length){
          _suggestion.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestion[i]);
      },
    );
  }
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(pair.asPascalCase),
    );
  }
}


