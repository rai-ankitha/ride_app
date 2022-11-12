class BookServiceModel{
  static late String mobileNumber;
  static late String vehicleType;
  static late String vehicleNumber;
  static late String serviceType;
  static late String comments;
  static late String slotDate;
  static late String slotTime;
  static late String dealerName;
  static late String dealerCity;


//   BookServiceModel({required this.mobileNumber,required this.vehicleType,required this.vehicleNumber,required this.serviceType,required this.comments});
//
   static Map toJson() {
    return {'Mobile Number': mobileNumber, 'Vehicle Number': vehicleNumber, 'Service Type': serviceType, 'VehicleType': vehicleType,'Slot Date': slotDate,'Time': slotTime,'Dealer': dealerName,'City': dealerCity,'Comments': comments,};
  }
// toList(){
//     return [mobileNumber,vehicleType,vehicleNumber,serviceType,comments,slotDate,slotTime];
// }
//   BookServiceModel.fromJson(Map json) {
//     mobileNumber = json['mobileNumber'];
//     vehicleType = json['vehicleType'];
//     vehicleNumber = json['vehicleNumber'];
//     serviceType = json['serviceType'];
//     comments = json['comments'];
//     slotDate = json['slotDate'];
//     slotTime = json['slotTime'];
//
//   }
}