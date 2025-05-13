import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar with Trible logo and location
              AppBar(),

              // Search Bar
              _buildSearchBar(),

              // Category Tabs (Recents, Favorites, etc.)
              _buildCategoryTabs(),

              // Promotional Cards
              _buildPromotionalCards(),

              // Discover Local Section
              _buildDiscoverLocalSection(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Trible',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                enabled: true, // Make it a non-clickable display for now
              ),
            ),
            Icon(Icons.mic, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          _categoryButton('Recents', Icons.access_time),
          _categoryButton('Favorites', Icons.favorite),
          _categoryButton('Restaurants', Icons.restaurant),
        ],
      ),
    );
  }

  Widget _categoryButton(String label, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF7BA7B1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionalCards() {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _promotionalCard(
            'Woodchuck Delivery',
            '\$15 off wood delivery until 1/1',
            'assets/wood_delivery.jpg',
          ),
          _promotionalCard(
            'Anthem Botique',
            '\$25 off with purchase of \$50 or more',
            'assets/boutique.jpg',
          ),
          _promotionalCard(
            'Harvest Bakery',
            'Kids Under 10 Eat Free, 1/5',
            'assets/burger.jpg',
          ),
        ],
      ),
    );
  }

  Widget _promotionalCard(String title, String description, String imagePath) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.grey.shade300,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(description, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscoverLocalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Text(
                'Discover Local ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7BA7B1),
                ),
              ),
              Icon(Icons.star, color: Color(0xFF7BA7B1)),
            ],
          ),
        ),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(8),
          children: [
            _categoryCard('Brewery', '0.5 Miles', 'assets/brewery.jpg'),
            _categoryCard('Barber', '1.2 Miles', 'assets/barber.jpg'),
            _categoryCard('Automotive', '2.7 Miles', 'assets/automotive.jpg'),
            _categoryCard('Photography', '3.1 Miles', 'assets/photography.jpg'),
            _categoryCard('Bakery', '0.3 Miles', 'assets/bakery.jpg'),
            _categoryCard('Hardware', '3.5 Miles', 'assets/hardware.jpg'),
            _categoryCard('Home', '2.5 Miles', 'assets/home.jpg'),
            _categoryCard('Paint', '6.8 Miles', 'assets/paint.jpg'),
            _categoryCard('Landscaping', '4.3 Miles', 'assets/landscaping.jpg'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'There will be more to explore soon!',
              style: TextStyle(
                color: Color(0xFF7BA7B1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            '© Trible 2025',
            style: TextStyle(color: Color(0xFF7BA7B1), fontSize: 12),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _categoryCard(String title, String distance, String imagePath) {
    return Card(
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 2),
                Text(
                  distance,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
