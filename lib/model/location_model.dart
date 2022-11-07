class LocationModel{
  late double lat;
  late double lon;
  late String place;
  late String title;

  LocationModel.fromJson(Map json){
    lat=json["results"]["geo"]["center"]["latitude"];
    lon=json["results"]["geo"]["center"]["longitude"];
  }
}