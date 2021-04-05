import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:zefyr/zefyr.dart';

class AddBlogScreen extends StatefulWidget {
  @override
  _AddBlogScreenState createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
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
        // hintText: 'Content',
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
      ),
    );

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
