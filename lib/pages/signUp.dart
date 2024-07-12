import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  DateTime? _date;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime(DateTime.now().year - 50),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  String _selectedDrawerItem = 'Sign Up';

  void _onSelectItem(String item) {
    setState(() {
      _selectedDrawerItem = item;
    });
    Navigator.pop(context);
    if (item == 'Home') {
      Navigator.pushNamed(context, '/');
    } else if (item == 'Sign In') {
      Navigator.pushNamed(context, '/signIn');
    } else if (item == 'Calculator') {
      Navigator.pushNamed(context, '/calculator');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Sign In'),
              onTap: () {
                Navigator.pushNamed(context, '/signIn');
              },
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
              onTap: () {
                Navigator.pushNamed(context, '/calculator');
              },
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
              'Sign Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },

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
                  return 'Please enter a password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}