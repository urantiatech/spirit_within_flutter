import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/contact_card.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spirit_within_flutter/widgets/secondary_button.dart';

class InviteScreen extends StatefulWidget {
  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  requestContactsPermission() async {
    await Permission.contacts.request();
  }

  Iterable<Contact> _contacts;
  bool isInvited = true;
  bool isUsing = true;
  getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  void initState() {
    super.initState();
    requestContactsPermission();
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('in build: ${contacts.length}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: normalTextColor,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Spirit Within',
          style: TextStyle(
            color: normalTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'SourceSerifPro',
          ),
        ),
      ),
      body: Column(
        children: [
          SearchBar(hintText: 'Search Contacts'),
          SizedBox(height: 15),
          _contacts != null
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      isInvited = !isInvited;
                      isUsing = !isUsing;
                      return ContactCard(
                        imgPath: 'assets/images/author.png',
                        contactName: _contacts.elementAt(index).displayName,
                        number: _contacts.elementAt(index).phones.first.value,
                        isInvited: isInvited,
                        isUsing: isUsing,
                      );
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )
        ],
      ),
    );
  }
}
