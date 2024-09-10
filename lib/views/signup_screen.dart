import 'package:flutter/material.dart';

import '../widgets/my_text_field.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String? username, email, phone, city, password, confirmPassword;
  String? gender = 'female';
  bool isAccpet = false, isNoti = false,isVisable = true;
  bool validateAndSaves() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save(); // حفظ قيم الحقول في المتغيرات
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          validateAndSaves();
        },
        child: Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.deepPurple,
                ),
                // حقل اسم المستخدم
                MyTextField(
                  labelText: 'Username',
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  suffix: Icon(Icons.person),
                  validator: (value) {
                    if (value!.length < 3) {
                      return 'username should 3 letters at least';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // حقل البريد الإلكتروني
                MyTextField(
                  labelText: 'Email',
                  suffix: Icon(Icons.email),
                  validator: (value) {
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return 'correct email format';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                MyTextField(
                  labelText: 'Phone',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this is requaired feild';
                    }
                    if (!RegExp(r'^[0-9]{9}$').hasMatch(value)) {
                      return 'phone number should be 9 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                // حقل المدينة
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.red)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: 'Choose city'),
                  items: [
                    'hadthramut',
                    "sana'a",
                    'alsher',
                    'almukla',
                    "ta'az",
                    'aden'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'this is requaired feild';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // حقل كلمة المرور
                MyTextField(
                  suffix: InkWell(
                    onTap: () => setState(() {
                      isVisable = !isVisable;
                    }),
                    child: Icon(!isVisable? Icons.visibility:Icons.visibility_off)),
                  labelText: 'Password',
                  obscureText: isVisable,
                  onSaved: (value) => password = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this is requaired feild';
                    }
                    if (value.length < 6) {
                      return 'the password should be at least 6 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // حقل تأكيد كلمة المرور
                MyTextField(
                  password: password,
                  obscureText: true,
                  labelText: 'Confirm password',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'this is required field';
                    }
                    if (val != password) {
                      return 'your passwords not compted';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // حقل الجنس
                Container(
                    padding: EdgeInsets.only(left: 5),
                    width: double.infinity,
                    child: Text(
                      'Choose gender',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text('Male'),
                      Radio(
                        activeColor: Colors.teal,
                        value: 'male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      Text('Female'),
                      Radio(
                        activeColor: Colors.teal,
                        value: 'female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isAccpet,
                        onChanged: (val) {
                          isAccpet = val!;
                          setState(() {});
                        }),
                    Text('I accpet the termes')
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isNoti,
                        onChanged: (val) {
                          isNoti = val!;
                          setState(() {});
                        }),
                    Text('Do you want send you notfication')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
