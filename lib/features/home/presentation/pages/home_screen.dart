import 'package:auvnet_flutter_internship_assessment/features/home/presentation/widgets/header_section.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/widgets/nearby_restaurants.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/widgets/promo_card.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/widgets/services_section.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/widgets/shortcuts_section.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  // You can add logic here to switch between actual pages if needed
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Example: Navigate or show snackbar
    // if (index == 1) Navigator.push(...);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: "Deliver"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const HeaderSection(),
            const SizedBox(height: 6),
            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Services:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const ServicesSection(),
                  const SizedBox(height: 20),
                  const PromoCard(),
                  const SizedBox(height: 14),
                  const Text('Shortcuts:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 21),
                  const ShortcutsSection(),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: PageView(
                      controller: _pageController,
                      children: List.generate(
                        6,
                            (_) => Image.asset('assets/ad.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 6,
                      effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey.shade300,
                        activeDotColor: const Color(0xFF8900FE),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Popular restaurants nearby',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
