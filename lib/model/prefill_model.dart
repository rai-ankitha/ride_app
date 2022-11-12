class PrefillModel{

  String? mobile;
  List<VehicleDetails> prefill=[];

 // PrefillModel({required this.mobile,});
PrefillModel.fromJson(Map json){
  mobile=json['mobile'];
  json['prefilled'].forEach((e)=>prefill.add(VehicleDetails.fromJson(e)));
}
  // toJson(){
  //   return{'mobile':mobile,'to':vehicleType,'distance':vehicleNumber};
  // }
}
class VehicleDetails{
  String? vehicleName;
  String? vehicleNumber;
  VehicleDetails.fromJson(Map json){
    vehicleName=json['vehicleType'];
    vehicleNumber=json['vehicleNumber'];
  }
}