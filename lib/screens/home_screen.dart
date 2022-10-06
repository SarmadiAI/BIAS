import 'dart:ui';
import 'package:bias/screens/add_product_screen.dart';
import 'package:bias/screens/checkout_screen.dart';
import 'package:bias/screens/home_screen_bodies/current_order_body.dart';
import 'package:bias/screens/home_screen_bodies/insights_body.dart';
import 'package:bias/screens/home_screen_bodies/inventory_body.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:bias/components/bias_text.dart';
import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  bool _canCheckout = false;

  List<Widget> _bodies = [
    InventoryBody(),
    CurrentOrderBody(),
    InsightsBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _currentIndex == 0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddProductScreen.id);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(CupertinoIcons.plus),
          backgroundColor: kBIASBlueColor.withOpacity(0.9),
        ),
      ),
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Opacity(
              opacity: 0.6,
              child: Container(
                height: 100,
                child: BottomAppBar(
                  notchMargin: 0,
                  clipBehavior: Clip.antiAlias,
                  child: BottomNavigationBar(
                    currentIndex: _currentIndex,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.black,
                    onTap: (index) {
                      setState(() {
                        if (_currentIndex == 1 && index == 1) {
                          Navigator.pushNamed(context, CheckoutScreen.id);
                        }
                        _currentIndex = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.cube_box,
                          size: 24,
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            color: _currentIndex == 1
                                ? Color(0xFF0043FF)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Icon(
                            _currentIndex == 1
                                ? CupertinoIcons.checkmark_alt_circle
                                : CupertinoIcons.shopping_cart,
                            size: 28,
                            color: _currentIndex == 1
                                ? Colors.white
                                : kBIASDarkGrayColor,
                          ),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.chart_pie,
                          size: 24,
                        ),
                        label: '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _bodies[_currentIndex],
    );
  }
}
