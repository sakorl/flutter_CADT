import 'dart:convert';

RandomUser getRandomUser(String data){
  Map<String, dynamic> map = json.decode(data);
  return RandomUser.fromMap(map);
}

class RandomUser{
  Info info;
  RandomUser({required this.info});

  factory RandomUser.fromMap(Map<String, dynamic> map){
    return RandomUser(info: Info.fromMap(map['info']));
  }

}

class Info{
  String seed;
  int results;
  int page;
  String version;

  Info({
    this.seed = "no seed",
    this.results = 0,
    this.page = 0,
    this.version="no version",

});

  factory Info.fromMap(Map<String, dynamic> map){
    return Info(
      seed: map['seed'],
      results: map['results'],
      page: map['page'],
      version: map['version']

    );
  }
}
