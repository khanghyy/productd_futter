import 'package:flutter/material.dart';
import 'package:learningproject/DangKy.dart';
import 'package:learningproject/Food.dart';
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image(image: AssetImage("asset/images/Picture1.png"),
                height: 200,
              ),
              TextFormField(
              validator: (value){
                if(value==null || value.isEmpty)
                  return "Vui Lòng Nhập Tên Đăng Nhập";
                else if(value.length<5)
                  return" Tên Đăng Nhập Quá Ngắn";
                return null;
              },
                decoration: InputDecoration(
                  label: Text("Tên Đăng Nhập"),
                  hintText: " Tên Đăng Nhập",
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty)
                    return "Vui Lòng Nhập Mật Khẩu";
                  else if(value.length<5)
                    return" Mật Khẩu Quá Ngắn";
                  return null;
                },
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text("Mật Khẩu"),
                    hintText: " Mật Khẩu",
                    prefixIcon: Icon(Icons.lock)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed:(){
                    if(_formKey.currentState!.validate()){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  FoodMoblie())
                      );
                    }
                    else{
                      //Form
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    fixedSize: Size(double.maxFinite,40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: Text("Đăng Nhập",style: TextStyle(
                    color:Colors.white,
                  ),)
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  DangKy())
                      );
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    fixedSize: Size(double.maxFinite,40),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: Text("Đăng Ký",style: TextStyle(
                    color:Colors.white,
                  ),)

              ),
            ],
          ),
        ),
      ),
    );
  }

}