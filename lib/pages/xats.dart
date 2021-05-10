import 'package:app/defaults/constants.dart';
import 'package:app/pages/newchat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:app/models/chatModel.dart';

import '../app_localizations.dart';

class Chats extends StatefulWidget {
  Chats({Key key}) : super(key: key);

  @override
  _Chats createState() => _Chats();
}

class _Chats extends State<Chats> {
  final textController = TextEditingController();
  List<Message> chats = [
    Message(messageContent: "Hello", messageType: "receiver"),
  ];

  /*@override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => NewChat()),
            );
          },
          child: const Icon(Icons.chat_outlined, color: Colors.black),
          backgroundColor: Constants.green(context)),
      /*body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10),
                    child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                                color:
                                    (messages[index].messageType == "receiver"
                                        ? Colors.white
                                        : Colors.green)),
                            padding: EdgeInsets.all(16),
                            child: Text(messages[index].messageContent,
                                style: TextStyle(
                                    fontSize: Constants.s(context))))));
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: TextField(
                          controller: textController,
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)
                                  .translate("Escriu_un_missatge"),
                              hintStyle: TextStyle(color: Colors.black54),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FloatingActionButton(
                        onPressed: () => setState(() => messages.add(Message(
                            messageContent: textController.text.toString(),
                            messageType: "receiver"))),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.green,
                        elevation: 0,
                      ),
                    ),
                  ],
                ))
          ],
        )*/
    ));
  }
}
