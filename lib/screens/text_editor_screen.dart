import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class TextEditorScreen extends StatefulWidget {
  @override
  _TextEditorScreenState createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    // (Note that delta must always end with newline.)
    final Delta delta = Delta()..insert("\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double editorHeight = screenHeight * 0.65;

    final editor = ZefyrField(
      height: editorHeight, // set the editor's height
      controller: _controller,
      focusNode: _focusNode,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Content',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      physics: ClampingScrollPhysics(),
    );
    final form = Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              editor
            ],
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: normalTextColor,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.send_rounded),
            tooltip: 'Upload',
            onPressed: () {
              debugPrint(_controller.document.toString());
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Spirit Within',
          style: TextStyle(
              color: normalTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: 'SourceSerifPro'),
        ),
      ),
      body: ZefyrScaffold(
        child: form,
        // child: ZefyrEditor(
        //   padding: EdgeInsets.all(16),
        //   controller: _controller,
        //   focusNode: _focusNode,
        // ),
      ),
    );
  }
}
