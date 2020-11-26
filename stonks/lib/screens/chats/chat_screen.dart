import 'package:flutter/material.dart';
import 'package:stonks/screens/chats/chat_thread_screen.dart';
import 'package:stonks/screens/chats/emogi_picker.dart';

class ChatScreen extends StatelessWidget {
  final String company;
  final bool increase;
  final double change;
  const ChatScreen(
      {Key key, @required this.company, @required this.increase, @required this.change})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  company,
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.info_outline,
                  color: Colors.black,
                  size: 16,
                )
              ],
            ),
            Text(
              "19,923 members",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$234.66",
                    style: TextStyle(color: Colors.black),
                  ),
                  CompanyStats(
                    change: change,
                    increase: increase,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: increase ? Colors.greenAccent[700] : Colors.red,
                      )),
                  onPressed: () => print("Trade pressed"),
                  color: increase ? Colors.greenAccent[700] : Colors.red,
                  child: Text("Trade"),
                ),
              ),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              MessageBlock(),
              MessageBlock(),
              MessageBlock(),
              MessageBlock(),
              MessageBlock(),
              MessageBlock(),
              MessageBlock(),
              MessageBlock(),
              MessageBlock(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
          Container(
            color: Colors.red,
            height: 30,
            width: double.infinity,
            child: Center(
              child: Text(
                "Restore your postion, lorem ipsum",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
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

class CompanyStats extends StatelessWidget {
  final bool increase;
  final double change;

  const CompanyStats({Key key, this.increase, this.change}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color changeColor = increase ? Colors.greenAccent[700] : Colors.red;
    return Container(
      width: 40,
      height: 25,
      child: Row(
        children: [
          increase
              ? Icon(
                  Icons.arrow_upward,
                  size: 10,
                  color: changeColor,
                )
              : Icon(
                  Icons.arrow_downward,
                  size: 10,
                  color: changeColor,
                ),
          Text(
            change.toString() + "%",
            style: TextStyle(fontSize: 12, color: changeColor),
          ),
        ],
      ),
    );
  }
}

class MessageBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 100,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MaterialButton(
                      child: Row(
                        children: [
                          Icon(Icons.message),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Reply in Thread"),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatThreadScreen(),
                          ),
                        );
                      },
                    ),
                    MaterialButton(
                      child: Row(
                        children: [
                          Icon(
                            Icons.sentiment_satisfied_alt,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Add a reaction"),
                        ],
                      ),
                      onPressed: () {
                        showEmojiPicker(context);
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatThreadScreen(),
          ),
        );
      },
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
    );
  }
}
