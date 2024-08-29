import 'package:flutter/material.dart';
import 'package:login_page/login_page.dart';
class SignupPage extends StatefulWidget {
   SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isHidden = true;
  final GlobalKey<FormState> validateconfirm=GlobalKey<FormState>();
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  TextEditingController nameController= new TextEditingController();
  TextEditingController fnameController= new TextEditingController();
  TextEditingController emailController= new TextEditingController();
  TextEditingController passwordController= new TextEditingController();
  TextEditingController cPasswordController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up "),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Form(
        key: validateconfirm,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter name";
                    }
                  },
                  controller: nameController,
                  decoration: InputDecoration(

                      labelText: 'Name',
                      hintText: "Enter Name",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.person),
                      )
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter Father Name";
                    }
                  },
                  controller: fnameController,
                  decoration: InputDecoration(
                      labelText: "Father Name" ,
                      hintText: "Enter Father Name",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.supervised_user_circle),
                      )
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter Email";
                    }
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email" ,
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.email_outlined),
                      )
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter Password";
                    }
                  },
                  controller: passwordController,
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    hintText: "Password",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.password),
                    ),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (value){
                    if(value!=passwordController.text){
                      return "Password dont match";
                    }
                  },
                  controller: cPasswordController,
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    label: Text('Confirm Password'),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8),
                    isDense: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.password),
                    ),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                    if(validateconfirm.currentState!.validate()){
                      setState(() {
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    }
                    });

                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Text('Sign Up',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
