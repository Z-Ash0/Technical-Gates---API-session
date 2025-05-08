import 'package:flutter/material.dart';
import 'package:api_session/widgets/product_card.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text('All Products',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildProductsGrid(),
          const Center(child: Text('Cart')),
          const Center(child: Text('Profile')),
          const Center(child: Text('Settings')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavBarItem('Home', Icons.home, 0),
          _buildBottomNavBarItem('Cart', Icons.shopping_cart, 1),
          _buildBottomNavBarItem('Profile', Icons.account_circle_outlined, 2),
          _buildBottomNavBarItem('Settings', Icons.settings, 3),
        ],
      ),
    );
  }

  Widget _buildProductsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 5,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => const ProductCard(),
      itemCount: 10,
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem(
      String label, IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC90051) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
