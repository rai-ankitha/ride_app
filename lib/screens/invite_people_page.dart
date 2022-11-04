import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../Providers/invite_provider.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {

  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllContacts();
    searchController.addListener(() {
      filterContacts();
    });
  }

  getAllContacts() async {
    if (await Permission.contacts.request().isGranted) {
      List<Contact> _contacts = (await ContactsService.getContacts()).toList();
      setState(() {
        contacts = _contacts;
      });
    }

  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String? contactName = contact.displayName?.toLowerCase();
        return contactName!.contains(searchTerm);
      });
      setState(() {
        contactsFiltered = _contacts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {},
          ),
          backgroundColor: const Color(0xFFED863A),
          centerTitle: true,
          title: Text(
            'Invite People',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 22.5,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Material(
              elevation: 2.0,
              shadowColor: Color.fromRGBO(194, 188, 188, 0.5),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Search Name",
                  labelStyle: GoogleFonts.roboto(
                      color: Color.fromRGBO(166, 166, 166, 0.87), fontSize: 14),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(194, 188, 188, 0.5))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white, width: 4.0)),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: isSearching == true
                        ? contactsFiltered.length
                        : contacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = isSearching == true
                          ? contactsFiltered[index]
                          : contacts[index];
                      return ListTile(
                          title: Text(contact.displayName.toString()),
                          //subtitle: Text((contact.phones?.elementAt(0).value).toString()),
                          leading: ((contact.avatar != null) &&
                                  (contact.avatar!.isNotEmpty))
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(contact.avatar!),
                                )
                              : CircleAvatar(
                                  child: Text(contact.initials()),
                                ),
                          trailing: InkWell(onTap: () {

                            print(contact.avatar.runtimeType);
                            Provider.of<InviteProvider>(context, listen: false)
                                .toggleContact(contact.displayName.toString(),(contact.phones?.elementAt(0).value).toString());
                          }, child: Consumer<InviteProvider>(builder:
                              (BuildContext context, value, Widget? child) {
                            return
                                   value
                                    .isExists(contact.displayName.toString(),(contact.phones?.elementAt(0).value).toString())
                                ? Image.asset(
                                    "assets/green_check.png",
                                    width: 30,
                                  )
                                : Image.asset(
                                    "assets/white_check.png",
                                    width: 30,
                                  );
                          })));
                    }))
          ]),
        ));
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
//
//
//
// class InvitePage extends StatefulWidget {
//   @override
//   _InvitePageState createState() => _InvitePageState();
// }
//
// class _InvitePageState extends State<InvitePage> {
//   List<Contact>? _contacts;
//   bool _permissionDenied = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchContacts();
//   }
//
//   Future _fetchContacts() async {
//     if (!await FlutterContacts.requestPermission(readonly: true)) {
//       setState(() => _permissionDenied = true);
//     } else {
//       final contacts = await FlutterContacts.getContacts();
//       setState(() => _contacts = contacts);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(title: Text('flutter_contacts_example')),
//           body: _body()));
//
//   Widget _body() {
//     if (_permissionDenied) return Center(child: Text('Permission denied'));
//     if (_contacts == null) return Center(child: CircularProgressIndicator());
//     return ListView.builder(
//         itemCount: _contacts!.length,
//         itemBuilder: (context, i) => ListTile(
//             title: Text(_contacts![i].displayName),
//             onTap: () async {
//               final fullContact =
//               await FlutterContacts.getContact(_contacts![i].id);
//               await Navigator.of(context).push(
//                   MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
//             }));
//   }
// }
//
// class ContactPage extends StatelessWidget {
//   final Contact contact;
//   ContactPage(this.contact);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: AppBar(title: Text(contact.displayName)),
//       body: Column(children: [
//         Text('First name: ${contact.name.first}'),
//         Text('Last name: ${contact.name.last}'),
//         Text(
//             'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
//         Text(
//             'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
//       ]));
// }
