import 'package:amber_erp/components/category_view_chart.dart';
import 'package:amber_erp/components/stats_grid.dart';
import 'package:flutter/material.dart';

class MyDashBord extends StatefulWidget {
  const MyDashBord({Key? key}) : super(key: key);

  @override
  _MyDashBordState createState() => _MyDashBordState();
}

class _MyDashBordState extends State<MyDashBord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: PreferredSize(preferredSize: Size.fromHeight(70),
      //   child: MyAppbar(),
      // ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildStatesTabBar(),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverToBoxAdapter(
              child: CategoryViewChart(),
            ),
          ),
        ],
      ),
    );
  }

  SliverPadding _buildStatesTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            //labelStyle: Styles.tabTextStyle
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.blueGrey,
            tabs: const <Widget>[
              Text('Today'),
              Text('Yesterday'),
              Text('Previous'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}
