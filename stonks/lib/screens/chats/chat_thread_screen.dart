import 'package:flutter/material.dart';
import 'package:stonks/screens/chats/chat_screen.dart';
import 'package:stonks/screens/chats/emogi_picker.dart';

class ChatThreadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Message",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          ThreadMessageBlock(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Type a Message   "),
                          ),
                        ),
                        Icon(Icons.expand_less),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.alternate_email,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.add_circle_outline),
                          ],
                        ),
                        Icon(Icons.send),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThreadMessageBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Row(
            children: [
              Text("Ariene McCoy"),
              SizedBox(width: 5),
              Text(
                "2:35 PM",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          subtitle: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Container(
            width: 30,
            height: 22,
            decoration: BoxDecoration(
                color: Colors.grey[350],
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: InkWell(
              onTap: () => showEmojiPicker(context),
              child: Icon(
                Icons.sentiment_satisfied_alt,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
