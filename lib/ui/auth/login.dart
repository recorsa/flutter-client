import 'package:flutter/material.dart';
import 'package:invoiceninja/redux/auth/auth_state.dart';

class Login extends StatelessWidget {
  AuthState authState;
  final Function(BuildContext, String, String, String) onLoginClicked;

  Login({
    Key key,
    @required this.authState,
    @required this.onLoginClicked,
  }) : super(key: key);

  //static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> _emailKey = GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _passwordKey = GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _urlKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    if (! authState.isInitialized) {
      return Container();
    }

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: new Image.asset('assets/images/logo.png',
              width: 100.0, height: 100.0),
        ),
        TextFormField(
          key: _emailKey,
          initialValue: authState.email,
          decoration: InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: (val) => val.isEmpty ? 'Please enter your email.' : null,
        ),
        TextFormField(
          key: _passwordKey,
          initialValue: authState.password,
          decoration: InputDecoration(labelText: 'Password'),
          validator: (val) => val.isEmpty ? 'Please enter your password.' : null,
          obscureText: true,
        ),
        authState.error == null ? Container() : Text(authState.error),
        TextFormField(
          key: _urlKey,
          initialValue: authState.url,
          decoration: InputDecoration(labelText: 'URL'),
          validator: (val) => val.isEmpty ? 'Please enter your URL.' : null,
          keyboardType: TextInputType.url,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Material(
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                this.onLoginClicked(context,
                    _emailKey.currentState.value,
                    _passwordKey.currentState.value,
                    _urlKey.currentState.value);
              },
              color: Colors.lightBlueAccent,
              child: Text('LOGIN', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
