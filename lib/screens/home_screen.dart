import 'dart:ui';
import 'package:bias/screens/add_product_screen.dart';
import 'package:bias/screens/checkout_screen.dart';
import 'package:bias/screens/home_screen_bodies/current_order_body.dart';
import 'package:bias/screens/home_screen_bodies/insights_body.dart';
import 'package:bias/screens/home_screen_bodies/inventory_body.dart';

import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  int currentIndex;
  HomeScreen({required this.currentIndex});
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _bodies = [
    const InventoryBody(),
    const CurrentOrderBody(),
    const InsightsBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: widget.currentIndex == 0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddProductScreen.id);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(CupertinoIcons.plus),
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
                    currentIndex: widget.currentIndex,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.black,
                    onTap: (index) {
                      setState(() {
                        if (widget.currentIndex == 1 && index == 1) {
                          Navigator.pushNamed(context, CheckoutScreen.id);
                        }
                        widget.currentIndex = index;
                      });
                    },
                    items: [
                      const BottomNavigationBarItem(
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
                            color: widget.currentIndex == 1
                                ? const Color(0xFF0043FF)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Icon(
                            widget.currentIndex == 1
                                ? CupertinoIcons.checkmark_alt_circle
                                : CupertinoIcons.shopping_cart,
                            size: 28,
                            color: widget.currentIndex == 1
                                ? Colors.white
                                : kBIASDarkGrayColor,
                          ),
                        ),
                        label: '',
                      ),
                      const BottomNavigationBarItem(
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
      body: _bodies[widget.currentIndex],
    );
  }
}
