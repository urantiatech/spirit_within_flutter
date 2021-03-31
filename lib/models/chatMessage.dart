import 'package:flutter/material.dart';

class ChatMessage {
  String message;
  bool isMe;
  String time;

  ChatMessage({
    @required this.message,
    @required this.isMe,
    @required this.time,
  });
}

ChatMessage m1 = ChatMessage(
  message:
      'Maybe you should try to install AC (Air Conditioning), so that the temprature is more comfortable',
  isMe: false,
  time: '08:00 PM',
);

ChatMessage m2 = ChatMessage(
  message:
      'Maybe you should try to install AC (Air Conditioning), so that the temprature is more comfortable',
  isMe: true,
  time: '09:00 PM',
);

List<ChatMessage> messageList = [m1, m2];
