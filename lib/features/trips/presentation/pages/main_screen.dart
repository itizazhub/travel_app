import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trips/presentation/pages/add_trip_screen.dart';
import 'package:travel_app/features/trips/presentation/pages/trips_screen.dart';
import 'package:travel_app/features/trips/presentation/providers/trip_provider.dart';

class MainScreen extends ConsumerWidget {
  // The PageController should be initialized here
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  // Sample profile picture
  String profilPic =
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load trips when the screen is built
    ref.watch(tripListNotifierProvider.notifier).loadTrips();

    // Add listener to PageController to update the current page
    _pageController.addListener(() {
      if (_pageController.hasClients) {
        _currentPage.value = _pageController.page!.round();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Itizaz 👋',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Travelling Today ?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        centerTitle: false,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.network(
                profilPic,
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController, // Ensure the controller is set
        children: [
          TripsScreen(),
          AddTripScreen(),
          Text("Maps"), // Consider replacing with an actual Maps screen later
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentPage,
        builder: (context, pageIndex, child) {
          return BottomNavigationBar(
            currentIndex: pageIndex, // Set the current page index
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'My Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add Trip',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Maps',
              ),
            ],
            onTap: (index) {
              // Jump to the selected page when the tab is tapped
              _pageController.jumpToPage(index);
            },
          );
        },
      ),
    );
  }
}
