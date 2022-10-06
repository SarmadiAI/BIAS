import 'package:bias/screens/charts_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/bias_text.dart';
import '../../components/dashboard_container.dart';
import '../../components/bias_heading.dart';
import '../../components/bias_title.dart';
import '../../constants.dart';

class InsightsBody extends StatefulWidget {
  const InsightsBody({Key? key}) : super(key: key);

  @override
  _InsightsBodyState createState() => _InsightsBodyState();
}

class _InsightsBodyState extends State<InsightsBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BIASHeading('Insights'),
                      Visibility(
                        visible: false,
                        child: Icon(
                          Icons.settings_outlined,
                          color: kBIASDarkGrayColor,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: BIASTitle('Featured Dashboards'),
          ),
          Container(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 20),
                DashboardContainer(
                  onTap: () {
                    Navigator.pushNamed(context, ChartsTest.id);
                  },
                  title: 'Your Progress\nThis Week!',
                  image: AssetImage('assets/images/patterns/pattern_1.png'),
                ),
                SizedBox(width: 10),
                DashboardContainer(
                  title: 'Your Progress\nThis Month!',
                  image: AssetImage('assets/images/patterns/pattern_2.png'),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: BIASTitle('Dashboards'),
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: DashboardContainer(
                    title: 'Sales\nDashboard',
                    image: AssetImage('assets/images/patterns/pattern_3.png'),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: DashboardContainer(
                    title: 'Products\nDashboard',
                    image: AssetImage('assets/images/patterns/pattern_4.png'),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: DashboardContainer(
                    title: 'Customers\nDashboard',
                    image: AssetImage('assets/images/patterns/pattern_5.png'),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
