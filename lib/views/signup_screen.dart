import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> frmKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(10),
          child: Form(
            key: frmKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      image: DecorationImage(
                          image: AssetImage("assets/images/default_user.png"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red),
                )),
                TextFormField(
                  validator: (x)=>x!=null && x.isNotEmpty?null:"this field is required",
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "example : Mokhtar Ba-Ghaleb",
                    label: Text("your name : "),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red))
                  ),
                ),
                TextFormField(
                  validator: (e)=>checkEmail(e),
                  keyboardType: TextInputType.url,
                ),
              ],
            ),
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton(onPressed: (){
        if(frmKey.currentState!.validate()){

        }

    },child: Icon(Icons.save),),),);
  }

  checkEmail(String? email){

    return "the email incorrect format";
  }
  checkPhoneNumber(String phone){

  }
}
