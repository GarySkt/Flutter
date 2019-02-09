import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'Bienvenido',
       theme: ThemeData(
         primaryColor: Colors.red,         
       ),
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
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Bievenido a flutter'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.list
              ),
              onPressed: _pushSaved,
            ), 
          ],
        ),
        body: _buildSuggestions(),       
      );
  }

void _pushSaved(){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context){
        final tiles = _saved.map((pair){
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        });
        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Favoritos'),
            ),
            body: ListView(children: divided,),
          );
      }
    )
  );
}

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd){
          return Divider();
        }
        if(i >= _suggestion.length){
          _suggestion.addAll(generateWordPairs().take(10));
        }
        final index = 1 ~/ 2;
        return _buildRow(_suggestion[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: (){
          setState(() {
           if(alreadySaved) {
             _saved.remove(pair);
           }else{
             _saved.add(pair);
           }
          });
        },
    );
  }
}


