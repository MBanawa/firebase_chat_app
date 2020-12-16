import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String username;
  final String userImage;
  final bool isMe;
  final Key key;

  MessageBubble(
    this.message,
    this.username,
    this.userImage,
    this.isMe, {
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.7,
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.headline6.color,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.headline6.color,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 3,
            left: isMe ? null : MediaQuery.of(context).size.width / 1.9,
            right: isMe ? MediaQuery.of(context).size.width / 1.9 : null,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(userImage),
            )),
      ],
      overflow: Overflow.visible,
    );
  }
}
