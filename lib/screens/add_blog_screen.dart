import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:spirit_within_flutter/config/urantia_icons_icons.dart';
import 'package:spirit_within_flutter/utils/zefyr_plugin/myapp_zefyr_image_delegate.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:zefyr/zefyr.dart';

import '../constants/app_constants.dart';
import '../widgets/divider_line.dart';
import 'bottom_bar.dart';
import 'font_size_screen.dart';

class AddBlogScreen extends StatefulWidget {
  @override
  _AddBlogScreenState createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  ZefyrController _controller;
  TextEditingController _titleController;
  FocusNode _focusNode;
  bool showZefyrHint = true;
  String _emptyZefyrField = '¶  ⏎';

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _loadDocument().then((document) {
      setState(() {
        _controller = ZefyrController(document);
      });
    });

    _loadTitle().then((value) {
      setState(() {
        _titleController = TextEditingController(text: value);
      });
    });
  }

  Future<NotusDocument> _loadDocument() async {
    final file = File(Directory.systemTemp.path + "/incomplete_blog.json");
    if (await file.exists()) {
      final contents = await file.readAsString();
      return NotusDocument.fromJson(jsonDecode(contents));
    }
    // (Note that delta must always end with newline.)
    final Delta delta = Delta()..insert("\n");
    return NotusDocument.fromDelta(delta);
  }

  Future<String> _loadTitle() async {
    final file = File(Directory.systemTemp.path + "/incomplete_title.json");
    if (await file.exists()) {
      final title = await file.readAsString();
      return jsonDecode(title);
    }
    return "";
  }

  void _saveIncompleteDocument(BuildContext context) {
    _saveIncompleteTitle();
    final contents = jsonEncode(_controller.document);
    final file = File(Directory.systemTemp.path + "/incomplete_blog.json");
    file.writeAsString(contents).then((_) {
      if (_emptyZefyrField != _controller.document.toString()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Saved'),
          ),
        );
      }
    });
  }

  void _saveIncompleteTitle() {
    final title = jsonEncode(_titleController.text);
    final file = File(Directory.systemTemp.path + "/incomplete_title.json");
    file.writeAsString(title);
  }

  Future<void> _deleteFromLocal() async {
    try {
      final fileTitle =
          File(Directory.systemTemp.path + "/incomplete_title.json");
      final fileBlogContent =
          File(Directory.systemTemp.path + "/incomplete_blog.json");

      await fileTitle.delete();
      await fileBlogContent.delete();
    } catch (e) {
      debugPrint('SW_ERROR: $e');
      // return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      setState(() {
        showZefyrHint = _emptyZefyrField == _controller.document.toString();
      });
      _controller.document.changes.listen((event) {
        setState(() {
          showZefyrHint = _emptyZefyrField == _controller.document.toString();
        });
      });
    }

    return WillPopScope(
      onWillPop: () async {
        _saveIncompleteDocument(context);
        return true;
      },
      child: Scaffold(
        appBar: buildCenteredAppBar(
          actions: [
            IconButton(
              icon: const Icon(
                UrantiaIcons.send_regular,
                size: 32,
              ),
              tooltip: 'Upload',
              onPressed: () {
                debugPrint(jsonEncode(_controller.document));
                _deleteFromLocal().then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomBar(navigationIndex: 0),
                      ),
                      (route) => false);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('Successfully Posted!'),
                    ),
                  );
                });
              },
            ),
          ],
        ),
        body: _controller == null
            ? CircularProgressIndicator()
            : ZefyrScaffold(
                child: Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          // maxLength: 40,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(40),
                          ],
                          controller: _titleController,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                          style: TextStyle(
                            fontSize: fontSize24,
                            fontWeight: FontWeight.w400,
                            color: normalTextColor,
                            fontFamily: 'SourceSansPro',
                          ),
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.only(bottom: 0),
                            hintText: 'Title',
                            hintStyle: TextStyle(
                              fontSize: fontSize24,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: ZefyrField(
                                controller: _controller,
                                focusNode: _focusNode,
                                autofocus: false,
                                imageDelegate: MyAppZefyrImageDelegate(),
                                decoration: InputDecoration(
                                  // hintText: 'Content',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: fontSize18,
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
                                        fontSize: fontSize18,
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
              ),
      ),
    );
  }
}
