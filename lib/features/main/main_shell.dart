import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../purchases/purchases_screen.dart';
import '../warranties/warranties_screen.dart';

/// Основний каркас після входу: нижня панель навігації з чотирма вкладками.
/// Вкладки тримаються в [IndexedStack], тому їхній стан не губиться
/// під час перемикання.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  static const int _homeTab = 0;
  static const int _purchasesTab = 1;
  static const int _warrantiesTab = 2;

  int _currentIndex = _homeTab;

  void _selectTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(
            onOpenPurchases: () => _selectTab(_purchasesTab),
            onOpenWarranties: () => _selectTab(_warrantiesTab),
          ),
          const PurchasesScreen(),
          const WarrantiesScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _selectTab,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Головна'),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Покупки',
          ),
          NavigationDestination(
            icon: Icon(Icons.verified_user),
            label: 'Гарантії',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Профіль'),
        ],
      ),
    );
  }
}
