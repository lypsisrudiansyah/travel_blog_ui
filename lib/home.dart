import 'package:flutter/material.dart';
import 'package:travel_blog_ui/widgets/most_popular.dart';

import 'widgets/travel_blog.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.menu,
                color: Colors.blue[300],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Travel Blog',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Expanded(flex: 4, child: TravelBlog()),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular',
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'View More',
                        style: TextStyle(fontSize: 16, color: Colors.blue[300]),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(flex: 3, child: MostPopular()),
            ],
          ),
        ),
      ),
    );
  }
}
