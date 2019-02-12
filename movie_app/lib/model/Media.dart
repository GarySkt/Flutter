class Media{
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genereIds;

  factory Media(Map jsonMap){ //constructor de modelo factory
    return new Media.deserialize(jsonMap);
  }
  
  //deserializar - xml transformarlo a un objeto

  Media.deserialize(Map json) : 
  id = json["id"].toInt(),
  voteAverage = json["vote_average"].toDouble(),
  title = json["title"],
  posterPath = json["poster_path"] ?? "",
  backdropPath = json["backdrop_path"] ?? "",
  overview = json["overview"],
  releaseDate = json["release_date"],
  genereIds = json["genre_ids"].toList();

}