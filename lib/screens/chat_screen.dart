import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_chat_app_starter/controller/auth.dart';
import 'package:flutter_course_chat_app_starter/models/message.dart';
import 'package:flutter_course_chat_app_starter/widgets/message_tile.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  void sendMessage() {
    if (_textEditingController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('messages').add({
        'text': _textEditingController.text,
        'email': Auth().email(),
        'date': DateTime.now().toString(),
      });

      _textEditingController.clear();
    }
  }

  Widget _buildChatView() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .orderBy('date')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.docs;

          List<Message> messages = [];

          for (var doc in docs) {
            messages.add(
              Message(
                text: doc['text'],
                date: DateTime.parse(doc['date']),
                email: doc['email'],
              ),
            );
          }

          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              var message = messages[index];

              return MessageTile(
                email: message.email,
                text: message.text,
                date: message.date,
              );
            },
          );
        });
  }

  Widget _buildTextField() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: 'Enter your message'),
            ),
          ),
        ),
        IconButton(
          color: Colors.blue,
          onPressed: () {
            sendMessage();
          },
          icon: Icon(Icons.send),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/cpes.svg',
          width: 75,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildChatView(),
          ),
          _buildTextField(),
        ],
      ),
    );
  }
}
