import 'package:flutter/material.dart';
import 'package:travel_blog_ui/model/travel.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;
  final double expandedHeight = 300;
  final double roundedContainerHeight = 50;
  DetailPage({required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            _buildSilverHead(),
            SliverToBoxAdapter(
              child: _buildDetail(),
            )
            // SliverToBoxAdapter(
            //   child: _buildDetail(),
            // )
          ],
        ),
        // AppBar
        Container(
          color: Colors.black12,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, right: 15, left: 15),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white)),
                  Icon(Icons.menu, color: Colors.white),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildSilverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        travel: travel,
        expandedHeight: expandedHeight,
        roundedContainerHeight: roundedContainerHeight,
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.5),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'View More',
                      style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 160, child: FeaturedWidget()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              travel.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${travel.name} User",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    travel.location,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Spacer(),
          Icon(
            Icons.share,
            color: Colors.blue[300],
          )
        ],
      ),
    );
  }
}

/* Pahami Extends SliverPersistentHeaderDelegate Bukan Stateless, lihat juga pada property yang tersedia didalam Widget buildnya */
class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;
  DetailSliverDelegate({required this.travel, required this.expandedHeight, required this.roundedContainerHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(travel.url, width: MediaQuery.of(context).size.width, height: expandedHeight, fit: BoxFit.cover),
        ),
        /* Pemahman Meletakkan Rounded Container diatas detailInfo */
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset + 5,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration:
                const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          ),
        ),
        /* Widget Nama Place dan Location Diatas Detail Info */
        Positioned(
            top: expandedHeight - shrinkOffset - 120,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(travel.name, style: TextStyle(color: Colors.white, fontSize: 30)),
                Text(
                  travel.location,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ))
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FeaturedWidget extends StatelessWidget {
  final _list = Travel.generateMostPopular();
  @override
  Widget build(Object context) {
    return ListView.separated(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var travel = _list[index];
          return Container(
            width: 120,
            child: Image.asset(travel.url, fit: BoxFit.cover),
          );
        },
        separatorBuilder: (_, index) => SizedBox(width: 10),
        itemCount: _list.length);
  }
}
