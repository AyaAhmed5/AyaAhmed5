//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   String? email;
//   String? password;
//   String? confirmPassword;
//   TextEditingController _confirmPasswordController = TextEditingController();
//   bool isLoading = false;
//   GlobalKey<FormState> formKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: isLoading,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Sign up",
//             style: TextStyle(
//               fontSize: 30,
//               fontFamily: "myfont",
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Color.fromARGB(255, 100, 69, 177),
//         ),
//         body: Form(
//           key: formKey,
//           child: SizedBox(
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 220, 214, 214),
//                     borderRadius: BorderRadius.circular(66),
//                   ),
//                   width: 266,
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: TextFormField(
//                     onChanged: (data) {
//                       setState(() {
//                         email = data;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       icon: Icon(
//                         Icons.person,
//                         color: Color.fromARGB(255, 226, 185, 185),
//                       ),
//                       hintText: "Username : ",
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 17),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 220, 214, 214),
//                     borderRadius: BorderRadius.circular(66),
//                   ),
//                   width: 266,
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter an email';
//                       }
//                       return null;
//                     },
//                     onChanged: (data) {
//                       setState(() {
//                         email = data;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       icon: Icon(
//                         Icons.email,
//                         color: Color.fromARGB(255, 102, 95, 104),
//                       ),
//                       hintText: "Your Email :",
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 17),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 220, 214, 214),
//                     borderRadius: BorderRadius.circular(66),
//                   ),
//                   width: 266,
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a password';
//                       }
//                       return null;
//                     },
//                     onChanged: (data) {
//                       setState(() {
//                         password = data;
//                       });
//                     },
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       suffix: Icon(
//                         Icons.visibility,
//                         color: const Color.fromARGB(255, 206, 200, 212),
//                       ),
//                       icon: Icon(
//                         Icons.lock,
//                         color: const Color.fromARGB(255, 128, 125, 130),
//                         size: 19,
//                       ),
//                       hintText: "Password :",
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 17),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 220, 214, 214),
//                     borderRadius: BorderRadius.circular(66),
//                   ),
//                   width: 266,
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please confirm your password';
//                       }
//                       if (value != password) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                     onChanged: (data) {
//                       setState(() {
//                         confirmPassword = data;
//                       });
//                     },
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       suffix: Icon(
//                         Icons.visibility,
//                         color: const Color.fromARGB(255, 206, 200, 212),
//                       ),
//                       icon: Icon(
//                         Icons.lock,
//                         color: const Color.fromARGB(255, 128, 125, 130),
//                         size: 19,
//                       ),
//                       hintText: "Confirm Password :",
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 17),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (formKey.currentState!.validate()) {
//                       setState(() {
//                         isLoading = true;
//                       });
//                       try {
//                         await registerUser(email!, password!);
//                         showSnackBar(context, "Registration successful");
//                         Navigator.pushNamed(context, "/autho");
//                       } catch (e) {
//                         showSnackBar(context, "Registration failed: $e");
//                       }
//                       setState(() {
//                         isLoading = false;
//                       });
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: const Color.fromARGB(255, 39, 110, 176),
//                     padding: EdgeInsets.symmetric(horizontal: 91, vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(27),
//                     ),
//                   ),
//                   child: Text(
//                     "Sign up",
//                     style: TextStyle(fontSize: 22),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void showSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   Future<void> registerUser(String email, String password) async {
//     final url = Uri.parse('https://localhost:44309/api/Auth/SignUp');
//     final response = await http.post(
//       url,
//       body: jsonEncode({'Email': email, 'password': password}),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       // Registration successful
//     } else {
//       throw Exception('Failed to register user: ${response.statusCode}');
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? FirstName;
  String? LastName;
  String? Email;
  String?UserName;
  String? Password;
  String? ConfirmPassword;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign up",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "myfont",
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 100, 69, 177),
        ),
        body: Form(
          key: formKey,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (data) {
                    setState(() {
                      FirstName = data;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                SizedBox(height: 17),
                TextFormField(
                  onChanged: (data) {
                    setState(() {
                      LastName = data;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                SizedBox(height: 17),
                TextFormField(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                  onChanged: (data) {
                    setState(() {
                      Email = data;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 17),
                TextFormField(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  onChanged: (data) {
                    setState(() {
                      Password = data;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 17),
                TextFormField(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (data != Password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onChanged: (data) {
                    setState(() {
                      ConfirmPassword = data;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                ),
                SizedBox(height: 17),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await registerUser(
                          FirstName!,
                          LastName!,
                          UserName!,
                          Email!,
                          Password!,
                          ConfirmPassword!
                        );
                        showSnackBar(context, "Registration successful");
                        Navigator.pushNamed(context, "/autho");
                      } catch (e) {
                        showSnackBar(context, "Registration failed: $e");
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 39, 110, 176),
                    padding: EdgeInsets.symmetric(horizontal: 91, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> registerUser(
      String FirstName,
      String LastName,
      String UserName,
      String Email,
      String Password,
      String ConfirmPassword
      ) async {
    final url = Uri.parse('your_api_endpoint/register');
    final response = await http.post(
      url,
      body: jsonEncode({
        'FirstName': FirstName,
        'LastName': LastName,
        "UserName":UserName,
        'Email': Email,
        'Password': Password,
        'ConfirmPassword':ConfirmPassword
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Registration successful
    } else {
      throw Exception('Failed to register user: ${response.statusCode}');
    }
  }
}
