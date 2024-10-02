import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current route name
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    // Determine the current index based on the route
    int currentIndex = 0;
    switch (currentRoute) {
      case '/home':
        currentIndex = 0;
        break;
      case '/search':
        currentIndex = 1;
        break;
      case '/profile':
        currentIndex = 2;
        break;
    }

    return BottomNavigationBar(
      currentIndex: currentIndex, // Set the current index based on route
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/search');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
