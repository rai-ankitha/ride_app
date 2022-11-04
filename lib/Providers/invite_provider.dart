import 'package:flutter/cupertino.dart';

class InviteProvider extends ChangeNotifier{
  List<String> selectedContact=[];
  toggleContact(String contact,String phone)
  {
   final isExists=selectedContact.contains(contact);
   if(isExists){
     selectedContact.remove(contact);
    notifyListeners();
  }
   else{
     selectedContact.add(contact);
    notifyListeners();
   }
}
bool isExists(String contact,String phone){
    return selectedContact.contains(contact);
}
}
