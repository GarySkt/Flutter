import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordFiel(),
          SizedBox(height: 20.0,),
          submitButton(),

        ],
      ),
      
    );
  }
//crear widgets 
  Widget emailField(){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'email@example.com',
            labelText: 'Email Address',  
            errorText: snapshot.error,       
          ),
        );
      }
    );
    
    
  }

  Widget passwordFiel(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );    
  }

  Widget submitButton(){

    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        return RaisedButton(
        child: 
        Text('Ingresar',
        style:TextStyle(
          color: Colors.white),
          ),
          color: Colors.lightBlue,
          onPressed: snapshot.hasData ? () { print ('ingresooo');} : null,
        );
      });    
  }
}