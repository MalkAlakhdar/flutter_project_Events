// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool _isDarkMode = false;
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(microseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void toggleMenu() {
    setState(() {
      if (isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      isExpanded = !isExpanded;
    });
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: _isDarkMode
              ? Colors.grey[900]
              : const Color.fromARGB(255, 183, 133, 222),
          title: Text(
            "Home Page",
            style: TextStyle(fontSize: 27),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: _isDarkMode
                      ? Colors.grey[900]
                      : const Color.fromARGB(255, 183, 133, 222),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Menu",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dark Mode",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        Switch(
                          value: _isDarkMode,
                          onChanged: _toggleTheme,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.app_registration),
                title: Text("Sign up"),
                onTap: () {
                  Navigator.pushNamed(context, "/signup");
                },
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text("Log in"),
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Text(
                " Events",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode
                      ? Colors.white // White text in dark mode
                      : const Color.fromARGB(
                          255, 137, 29, 221), // Original color in light mode
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: _isDarkMode
                      ? Colors.grey.withOpacity(_animation.value)
                      : Colors.purple.withOpacity(_animation.value),
                );
              },
            ),
            if (isExpanded)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      'Reminder',
                      style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Camera',
                      style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Attachment',
                      style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Text Note',
                      style: TextStyle(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: toggleMenu,
                      backgroundColor: _isDarkMode
                          ? Colors.grey[800]
                          : const Color.fromARGB(255, 183, 133, 222),
                      child: Icon(
                        isExpanded ? Icons.close : Icons.add,
                        size: 30,
                        color: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.flash_on,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
