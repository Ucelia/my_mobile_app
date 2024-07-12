import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  final Function toggleTheme;
  final bool isDarkMode;
  Home({required this.toggleTheme, required this.isDarkMode});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;


  void _onItemTapped(int index, String route) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, route);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        actions: [
          Switch(
            value: widget.isDarkMode,
            onChanged: (value) {
              widget.toggleTheme();
            },
          ),
        ],
      ),

      //body: _selectedIndex,
      bottomNavigationBar: BottomNavigationBar(
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'SignIn',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'SignUp',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.green[900],
        onTap: (index) {
          switch (index) {
            case 0:
              _onItemTapped(index, '/');
              break;
            case 1:
              _onItemTapped(index, '/signIn');
              break;
            case 2:
              _onItemTapped(index, '/signUp');
              break;
            case 3:
              _onItemTapped(index, '/calculator');
              break;
          }
        },
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              tileColor: _selectedIndex == 0 ? Colors.blue[100] : null,
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Sign In'),
              tileColor: _selectedIndex == 1 ? Colors.blue[100] : null,
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1, '/signIn');
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Sign Up'),
              tileColor: _selectedIndex == 2 ? Colors.blue[100] : null,
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2, '/signUp');
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculator'),
              tileColor: _selectedIndex == 3 ? Colors.blue[100] : null,
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3, '/calculator');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/images1.jpg'), // Your app logo here
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to Our App!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Your one-stop solution for managing your tasks efficiently.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
              child: Text('Get Started'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
            // SizedBox(height: 20.0),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/signUp');
            //   },
            //   child: Text('Learn More'),
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 16.0),
            //     backgroundColor: Colors.grey,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}