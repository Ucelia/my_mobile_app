import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
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
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
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
}
