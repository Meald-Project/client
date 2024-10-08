import 'package:flutter/material.dart';
import '../../viewmodels/user_view_model.dart';
import '../../widgets/sidebar_popup.dart';
import 'restaurants_list.dart';
import 'panier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

import 'home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meald/viewmodels/user_view_model.dart';
import 'package:meald/views/pages/login.dart';
import 'panier.dart';
import 'favoris_page.dart';
import 'historique_page.dart';
import 'localisations.dart';
import 'parametres.dart';
import 'profile_page.dart';

//code
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Acceuil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoris',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Sac',
        ),
      ],
      selectedItemColor: Colors.green, 
      unselectedItemColor: Theme.of(context).colorScheme.secondary, 
      currentIndex: _currentIndex, 
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });

        switch(index) {
          case 1:
         Navigator.of(context).pushNamed('/profilePage_client');
         break;

        }
      },
    );
  }
}
class HomePageClient extends StatefulWidget {
  final UserViewModel userViewModel;
  HomePageClient({required this.userViewModel});

  @override
  _HomePageClientState createState() => _HomePageClientState();
}

class _HomePageClientState extends State<HomePageClient> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePageR(userViewModel: widget.userViewModel)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/LOGO.png', 
          height: 130,
          width: 130,
        ),
      ),
    );
  }
}

class HomePageR extends StatefulWidget {
  final UserViewModel userViewModel;

  HomePageR({required this.userViewModel});

  @override
  _HomePageRState createState() => _HomePageRState();
}

class _HomePageRState extends State<HomePageR> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeScreen(userViewModel: widget.userViewModel),
      ProfilePage(),
      FavorisPage(),
      ChartPage(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Sac',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

