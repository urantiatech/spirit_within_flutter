import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:zefyr/zefyr.dart';

import '../constants/app_constants.dart';
import '../widgets/divider_line.dart';

class AddBlogScreen extends StatefulWidget {
  @override
  _AddBlogScreenState createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;
  bool showZefyrHint = true;
  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _controller = ZefyrController(document);
    String _emptyZefyrField = _controller.document.toString();
    _controller.document.changes.listen((event) {
      setState(() {
        showZefyrHint = _emptyZefyrField == _controller.document.toString();
      });
    });
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    // (Note that delta must always end with newline.)
    final Delta delta = Delta()..insert("\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.send_rounded),
            tooltip: 'Upload',
            onPressed: () {
              debugPrint(_controller.document.toString());
            },
          ),
        ],
      ),
      body: ZefyrScaffold(
        child: Padding(
          padding: EdgeInsets.only(top: 24),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  // maxLength: 80,
                  textCapitalization: TextCapitalization.sentences,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.only(bottom: 0),
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: subtleTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DividerLine(),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ZefyrField(
                        controller: _controller,
                        focusNode: _focusNode,
                        autofocus: false,
                        decoration: InputDecoration(
                          // hintText: 'Content',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: subtleTextColor,
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                        physics: ClampingScrollPhysics(),
                      ),
                    ),
                    showZefyrHint
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 24),
                            child: Text(
                              'Content',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: subtleTextColor,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
        // child: ZefyrEditor(
        //   padding: EdgeInsets.all(16),
        //   controller: _controller,
        //   focusNode: _focusNode,
        // ),
      ),
    );
  }
}
