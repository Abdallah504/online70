import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/contact.dart';
import 'contact-det.dart';


class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final Box<Contact> contactBox = Hive.box<Contact>('contact');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: ValueListenableBuilder(
        valueListenable: contactBox.listenable(),
        builder: (context, Box<Contact> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No entries yet.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final contact = box.getAt(index);
              if (contact == null) return SizedBox.shrink();

              return ListTile(
                leading: contact.imagePath != null &&
                    File(contact.imagePath!).existsSync()
                    ? Image.file(File(contact.imagePath!), height: 60, width: 60)
                    : Icon(Icons.person, size: 60),
                title: Text(contact.title ?? 'No Title'),
                subtitle: Text(contact.phone ?? 'No Phone Number'),
                trailing: Wrap(
                  spacing: 8,
                  children: [
                    IconButton(
                      onPressed: () {
                        box.deleteAt(index);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () async {
                        final Uri phoneUri = Uri(
                          scheme: 'tel',
                          path: contact.phone,
                        );
                        await launchUrl(phoneUri);
                        // if (await canLaunchUrl(phoneUri)) {
                        //   await launchUrl(phoneUri);
                        // } else {
                        //   final snackBar =
                        //   SnackBar(content: Text("Can't make the phone call"));
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // }
                      },
                      icon: Icon(Icons.call, color: Colors.green),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactDetail(data: contact),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactDetail()),
          );
        },
      ),
    );
  }
}
