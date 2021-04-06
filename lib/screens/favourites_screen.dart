import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/models/blog.dart';
import 'package:spirit_within_flutter/widgets/blog_list_item.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<Blog> favouritesList = blogList;
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
                        // caption: 'Remove',
                        color: Color(0xFF07B7FC),
                        // color: Color(0xFFF1B94B),
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
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'SourceSansPro',
                              ),
                            )
                          ],
                        ),
                        // icon: Icons.star_border_rounded,
                        onTap: () {
                          setState(() {
                            favouritesList.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
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
          )
          // BlogListItem(
          //   title: 'Lorem ipsum dolor sit amet',
          //   description:
          //       'long text long text long text long text long text long text long text long text long text long text',
          //   time: '2 hours ago',
          //   author: 'Peter Parker',
          //   imgPath: 'assets/images/mona.jpg',
          // ),
          // BlogListItem(
          //   title: demoBlog1.title,
          //   description:
          //       'long text long text long text long text long text long text',
          //   time: '2 hours ago',
          //   author: 'Peter Parker',
          //   imgPath: 'assets/images/mona.jpg',
          // ),
          // BlogListItem(
          //   title: demoBlog1.title,
          //   description:
          //       'long text long text long text long text long text long text',
          //   time: '2 hours ago',
          //   author: 'Peter Parker',
          //   imgPath: 'assets/images/mona.jpg',
          // ),
        ],
      ),
    );
  }
}
