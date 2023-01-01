import 'package:flutter/material.dart';
import 'package:travel_blog_ui/detail.dart';
import 'package:travel_blog_ui/model/travel.dart';

class TravelBlog extends StatelessWidget {
  final _list = Travel.generateTravelBlog();
  final _pageCtrl = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageCtrl,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          var travel = _list[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DetailPage(travel: travel);
              }));
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, bottom: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      travel.url,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(color: Colors.transparent, child: Text(travel.location, style: TextStyle(color: Colors.white, fontSize: 20))),
                      Material(
                          color: Colors.transparent,
                          child: Text(travel.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30))),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 25,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(color: Colors.blue[300], borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.chevron_right_sharp, color: Colors.white, size: 30),
                  ),
                )
              ],
            ),
          );
        });
  }
}
