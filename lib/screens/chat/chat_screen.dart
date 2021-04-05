import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/models/chatMessage.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String authorName;
  ChatScreen({@required this.authorName});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String message;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(title: widget.authorName),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: messageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ChatBubble(
                          messageText:
                              messageList.reversed.toList()[index].message,
                          isMe: messageList.reversed.toList()[index].isMe,
                          time: messageList.reversed.toList()[index].time,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  // height: 48,
                  margin: EdgeInsets.only(bottom: 30, left: 30, right: 13),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF3F8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    // maxLines: 2,
                    // maxLength: 280,
                    // inputFormatters: [
                    //   LengthLimitingTextInputFormatter(280),
                    // ],
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(
                        color: moreSubtleTextColor,
                        fontSize: 16,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: normalTextColor,
                      fontSize: 16,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w400,
                    ),
                    cursorColor: Theme.of(context).accentColor,
                    onChanged: (String keyword) {
                      debugPrint(keyword);
                      message = keyword;
                    },
                  ),
                ),
              ),
              Container(
                height: 48,
                width: 48,
                margin: EdgeInsets.only(right: 30, bottom: 30),
                decoration: BoxDecoration(
                  color: activeBlue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: IconButton(
                  // splashRadius: 28,
                  // splashColor: Color(0x113177E0),
                  onPressed: () {
                    setState(() {
                      setState(() {
                        ChatMessage chatMessage = ChatMessage(
                            message: message, isMe: true, time: '9:00 PM');
                        messageList.add(chatMessage);
                        _controller.clear();
                      });
                      // message = message;
                    });
                  },
                  icon: Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
