import 'package:flutter/material.dart';
import 'package:learningproject/Food.dart';
class DangKy extends StatelessWidget {
  DangKy({Key? key}) : super(key: key);
  var _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image(image: AssetImage("asset/images/Picture2.png"),
                height: 200,
              ),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty)
                    return "Vui Lòng Nhập Họ Và Tên";
                  else if(value.length<5)
                    return" Tên Quá Ngắn";
                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Họ Và tên"),
                    hintText: " Họ và Tên",
                    prefixIcon: Icon(Icons.note_alt)
                ),
              ),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty)
                    return "Vui Lòng Nhập Số Điện Thoại";
                  else if(value.length<5)
                    return" Sai Số Điện Thoại";
                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Số Điện Thoại"),
                    hintText: " Số Điện Thoại",
                    prefixIcon: Icon(Icons.phone)
                ),
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
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty)
                    return "Vui Lòng Lại Nhập Mật Khẩu";
                  else if(value.length<5)
                    return" Mật Khẩu Quá Ngắn";
                  return null;
                },
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text(" Nhập Lại Mật Khẩu"),
                    hintText: " Nhập Lại Mật Khẩu",
                    prefixIcon: Icon(Icons.lock)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  FoodMoblie())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent,
                    fixedSize: Size(double.maxFinite,40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: Text("Đăng Ký",style: TextStyle(
                    fontSize: 18,
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