class MilestoneRecord{
  int? id;
  String? from;
  String? to;
  String? distance;

  MilestoneRecord({required this.id,required this.from,required this.to,required this.distance});

 toJson(){
    return{'from':from,'to':to,'distance':distance};
}

}