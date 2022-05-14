import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:re_mind/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key, this.user}) : super(key: key);
  static const routeName = '/profile';
  final User user;


//user.photoURL user.displayName user.email
  Widget _buildCard(BuildContext context) {
    final fu = FirebaseAuth.instance.currentUser;

    return Card(
      child: ListTile(
        leading: Image.network(fu.photoURL),
        title: Text(fu.displayName),
        subtitle: Text(fu.email),
        trailing: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            //Navigator.pushNamed(context, '/profile-edit', arguments: user);
          },
        ),
      ),
    );
  }

  Widget _buildSignOut(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('Sign out'),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
            // Navigator.pushReplacementNamed(context, '/auth');
          },
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFFF6EEAE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildCard(context),
            _buildSignOut(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6EEAE),
      appBar: AppBar(title: Text('Profile',
        style: TextStyle(color: Color(0xFF4D4C46)) , ) ,
        backgroundColor: Color(0xFFE5C2F5),),
      body: _buildBody(context),
    );
  }
}