import 'package:flutter/material.dart';
import 'package:login_page/signUp_page.dart';
class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   TextEditingController emailController= TextEditingController();
   TextEditingController passwordController= TextEditingController();
   final GlobalKey<FormState>validateEmpty =GlobalKey<FormState>();
   String email ='ali';
   String password ='123';
   bool _isHidden = true;
   void _togglePasswordView() {
     setState(() {
       _isHidden = !_isHidden;
     });
   }
   bool validateEmail = false;
   bool validatePassword= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login '),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: null,
      ),
      body: Form(
        key: validateEmpty,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
                  Image(
                      image: AssetImage("assets/flutter_logo.png"),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    validator: (value){
                      if(value!=null){
                        return "Enter Email";
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: "Email",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(Icons.email_outlined),
                        ),
                    ),

                  ),
              SizedBox(height: 20,),
              TextFormField(
                 validator: (value){
                   if(value!=null){
                     return "Enter Password";
                   }
                 },
                obscureText: _isHidden,
                controller: passwordController,
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
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                    if(validateEmpty.currentState!.validate()){
                      setState(() {});
                    }
                    if  (emailController.text==email ||passwordController.text==password){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignupPage()));
                    }
                    else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter Valid Email and Password')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white

                  ),
                  child: Center(child: Text("Login"))
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Don't have Account ?"),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                    },
                      child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              )
            ],
                ),
        ),
      ),
    );
  }
  void dispose(){
     emailController.dispose();
     passwordController.dispose();
     super.dispose();
  }
}
