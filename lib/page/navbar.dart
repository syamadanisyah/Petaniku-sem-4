import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:petaniku2/page/Lupa_password/design_profile.dart';
import 'package:petaniku2/page/design_search.dart';
import 'package:petaniku2/page/design_barang.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class navbar_bottom extends StatefulWidget {
  const navbar_bottom({super.key});

  @override
  State<navbar_bottom> createState() => _navbar_bottomState();
}

class _navbar_bottomState extends State<navbar_bottom> {

 




  @override
  Widget build(BuildContext context) {

     PersistentTabController _controller;

_controller = PersistentTabController(initialIndex: 0);


List<Widget> _buildScreens() {
        return [
          design_barang(),
          
        ];
    }

List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Icons.home,),
                title: ("Home"),
                activeColorPrimary: warna.hijau,
                inactiveColorPrimary: Colors.grey[400],
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.search,),
                title: ("Search"),
                activeColorPrimary: Colors.amber,
                inactiveColorPrimary: Colors.grey[400],
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.account_circle_outlined,),
                title: ("Akun"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: Colors.grey[400],
            ),
        ];
    }


    return PersistentTabView(
      context,
      controller: _controller,
     screens:[
      design_barang(),
      design_search(),
      design_profile()

     ],
     items: _navBarsItems(), 
     backgroundColor: Colors.white,
     handleAndroidBackButtonPress: true,
     //berfungsi untuk bisa bergerak ke atas jika di tekan
     resizeToAvoidBottomInset: true,

     hideNavigationBarWhenKeyboardShows: true,

       

     decoration: NavBarDecoration(
      borderRadius: BorderRadius.circular(10),
      colorBehindNavBar: Colors.white
     ),
      
       popAllScreensOnTapOfSelectedTab: true,
       popActionScreens: PopActionScreensType.all,
       itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
         
         screenTransitionAnimation: ScreenTransitionAnimation(
           duration: Duration(milliseconds: 200),
          curve: Curves.ease,
         ),

     navBarStyle: NavBarStyle.style9,
     );
  }
}