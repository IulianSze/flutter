import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/consts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness_app/pages/register.dart';
import 'package:fitness_app/fetches.dart';

class LoginPage extends StatelessWidget { 
    LoginPage({super.key});

      var usernameController = TextEditingController();
      var passwordController = TextEditingController();
    @override
    Widget build(BuildContext context){
      
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          body: Container(
            height: double.maxFinite,
            //width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [g1,g2]),
              ),
            child: SingleChildScrollView(
              child:Padding(
                padding: EdgeInsets.all(size.height*0.060),
                child:Column(
                  children: [
                    Image.asset(imgGantera),
                    Text(
                      "Good job staying fit!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.white60.withOpacity(0.7),
                      ),
                      ),
                    const Text(
                      "Please Log In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Colors.white,
                      ),
                    ), 
                    SizedBox(height: size.height * 0.04),
                    TextField(
                      controller: usernameController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //contentPadding: const EdgeInsets.symmetric(vertical:25.0),
                        filled: true,
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: SvgPicture.asset(userIcon),
                        ),
                        hintText: "Username",
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(37)),
                        ),
                      ),
                      ),
                      SizedBox(height: size.height * 0.015,),
                      TextField(
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //contentPadding: const EdgeInsets.symmetric(vertical:25.0),
                        filled: true,
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: SvgPicture.asset(passwordIcon),
                        ),
                        hintText: "Password",
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(37)),
                        ),
                      ),
                      ),
                      SizedBox(height: size.height * 0.020),
                     CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        height: size.height * 0.080,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(37)),
                        ),
                        child:const Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          ),
                        ),
                       onPressed: (){
                         login(context, usernameController, passwordController);
                       },
                ),
                SizedBox(height: size.height*0.025),
                SvgPicture.asset(orIcon),
                 SizedBox(height: size.height*0.025),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        height: size.height * 0.080,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 241, 187, 105),
                          borderRadius: BorderRadius.all(Radius.circular(37)),
                        ),
                        child:const Text(
                          "Make a new account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          ),
                        ),
                       onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const Register())));
                       },
                    ),
                  ],
                ),
              ),
             ),
            ),
        );
    }
}