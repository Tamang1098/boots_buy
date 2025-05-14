import 'package:flutter/material.dart';

class LoginScreenview extends StatelessWidget {
  const LoginScreenview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14141d),
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),

      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/login.png'),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.white24,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    style: TextStyle(color: Colors.white,
                    fontSize: 20),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Colors.white70,
                      fontSize: 25,
                      ),
                      prefixIcon: Icon(Icons.email,
                      color: Colors.white,)
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 3,color: Colors.white),
                      ),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      prefixIcon: Icon(Icons.password,
                      color: Colors.white,)
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue, // background color
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Let container color show
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Center(child: Text('Login',style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w600
                  ),)),
                ),
              ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text("Dont Have An Account ?",style: TextStyle(
                        color: Colors.white70,
                        fontSize:20,
                      ),),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue, // background color
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, // Let container color show
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Center(child: Text('SignUp',style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),)),
                        ),
                      ),
                    ],
                  )

              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
