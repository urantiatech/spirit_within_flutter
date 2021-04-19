import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/contact_card.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

import 'font_size_screen.dart';

class InviteScreen extends StatefulWidget {
  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  Iterable<Contact> _contacts;
  bool isInvited = true;
  bool isUsing = true;
  bool isContactsPermissionDenied = false;
  List<Contact> _contactsList;
  List<Contact> _contactsListCopy;

  getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts;
        _contactsList = _contacts.toList();
        _contactsListCopy = List.from(_contactsList);
      });
    }
    if (await Permission.contacts.isDenied) {
      setState(() {
        isContactsPermissionDenied = true;
      });
    }
  }

  onItemChanged(String value) {
    setState(() {
      _contactsListCopy = _contactsList
          .where((contact) =>
              contact.displayName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: isContactsPermissionDenied
          ? Center(
              child: Text(
                'Permission Denied',
                style: TextStyle(
                  fontSize: fontSize24,
                  fontWeight: FontWeight.w300,
                  color: normalTextColor,
                  fontFamily: 'SourceSansPro',
                ),
              ),
            )
          : Column(
              children: [
                SearchBar(
                  hintText: 'Search Contacts',
                  onChangedFunction: onItemChanged,
                ),
                SizedBox(height: 15),
                _contactsListCopy != null
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _contactsListCopy.length,
                          itemBuilder: (BuildContext context, int index) {
                            // isInvited = !isInvited;
                            // isUsing = !isUsing;
                            isInvited = Random().nextBool();
                            isUsing = Random().nextBool();
                            return ContactCard(
                              imgPath: 'assets/images/author.png',
                              contactName: _contactsListCopy
                                  .elementAt(index)
                                  .displayName,
                              number: _contactsListCopy
                                  .elementAt(index)
                                  .phones
                                  .first
                                  .value,
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
