import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spirit_within_flutter/models/blog.dart';
import 'package:spirit_within_flutter/widgets/blog_list_item.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

import 'font_size_screen.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

/*toList() is necessary otherwise it'll copy the reference and the original list
 will be modified if we modify the copied list*/
List<Blog> favouritesList = blogList.toList();

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: Column(
        children: [
          SearchBar(hintText: 'Search Favourite Blogs'),
          SizedBox(height: 14),
          Expanded(
            child: ListView.builder(
                itemCount: favouritesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: [
                      IconSlideAction(
                        color: Color(0xFF07B7FC),
                        iconWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_border_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Remove',
                              style: TextStyle(
                                fontSize: fontSize16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'SourceSansPro',
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            favouritesList.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Removed from Favourites'),
                            ),
                          );
                        },
                      ),
                    ],
                    child: BlogListItem(
                      title: favouritesList[index].title,
                      description: favouritesList[index].title +
                          favouritesList[index].title,
                      time: favouritesList[index].dateTime,
                      imgPath: favouritesList[index].imgPath,
                      author: favouritesList[index].author,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
