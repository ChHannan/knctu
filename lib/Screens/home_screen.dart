import 'package:flutter/material.dart';
import 'package:knctu/widgets/header/custom_header.dart';
import 'package:knctu/widgets/question_block.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomAppBar(deviceHeight * 0.40),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                15,
                0,
                0,
              ),
              child: Text(
                'Recommended',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => QuestionBlock(),
              childCount: 5,
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomAppBar(this.expandedHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomHeader(),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(CustomAppBar oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight;
  }
}
