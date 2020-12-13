import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/TBhaWTuYLkUDpWtcbxha/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          return ListView.builder(
            itemCount: streamSnapshot.data.docs.length,
            itemBuilder: (ctx, index) => Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('works!'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
