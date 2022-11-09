class BookServiceModel{
  static String? mobileNumber;
  static String? vehicleType;
  static String? vehicleNumber;
  static String? serviceType;
  static String? comments;
  static String? slotDate;
  static String? slotTime;
  static String? dealer;
  static String? city;

  // BookServiceModel({required this.mobileNumber,required this.vehicleType,required this.vehicleNumber,required this.serviceType,required this.comments});

  Map toJson() {
    return {'mobileNumber': mobileNumber, 'vehicleType': vehicleType, 'vehicleNumber': vehicleNumber, 'serviceType': serviceType,'comments': comments,'slotDate': slotDate,'slotTime': slotTime,'city': city,'dealer':dealer};
  }
toList(){
    return [mobileNumber,vehicleType,vehicleNumber,serviceType,comments,slotDate,slotTime,city,dealer];
}
  BookServiceModel.fromJson(Map json) {
    mobileNumber = json['mobileNumber'];
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    serviceType = json['serviceType'];
    comments = json['comments'];
    slotDate = json['slotDate'];
    slotTime = json['slotTime'];
    city = json['city'];
    dealer=json['dealer'];
  }
}