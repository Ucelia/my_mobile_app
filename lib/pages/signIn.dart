import 'package:flutter/material.dart';
import 'home.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int _selectedIndex = 0;


  void _onItemTapped(int index, String route) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, route);
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _selectedDrawerItem = 'Sign In';

  void _onSelectItem(String item) {
    setState(() {
      _selectedDrawerItem = item;
    });
    Navigator.pop(context);
    if (item == 'Home') {
      Navigator.pushNamed(context, '/');
    } else if (item == 'Sign Up') {
      Navigator.pushNamed(context, '/signUp');
    } else if (item == 'Calculator') {
      Navigator.pushNamed(context, '/calculator');
    }
  }

  // void _signIn() {
  //   // Navigate to the home screen or show a success message
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) => Home(onThemeChanged: (ThemeMode) {  },),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),

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
          key: _formKey,
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
              onTap: () => _onSelectItem('Home'),
              selected: _selectedDrawerItem == 'Home',
              selectedTileColor: Colors.blue[100],
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Sign In'),
              onTap: () => _onSelectItem('Sign In'),
              selected: _selectedDrawerItem == 'Sign In',
              selectedTileColor: Colors.blue[100],
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Sign Up'),
              onTap: () => _onSelectItem('Sign Up'),
              selected: _selectedDrawerItem == 'Sign Up',
              selectedTileColor: Colors.blue[100],
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculator'),
              onTap: () => _onSelectItem('Calculator'),
              selected: _selectedDrawerItem == 'Calculator',
              selectedTileColor: Colors.blue[100],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
