// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mokhtar_e_store/widgets/my_text_field.dart';

class OrderFormScreen extends StatefulWidget {
  const OrderFormScreen({super.key});

  @override
  State<OrderFormScreen> createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String paymentWay = 'cash';
  String? time, username, phone, notes;
  bool validateAndSave() {
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
      appBar: AppBar(
        title: Text('Order form'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyTextField(
                  labelText: 'Your name',
                  hintText: 'Ahmad mohmmad ben...',
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  suffix: Icon(Icons.account_circle),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this is requaired feild';
                    }
                    if (RegExp(r"^[A-Za-z]+ +[A-Za-z]+ [A-Za-z]")
                        .hasMatch(value)) {
                      return 'please thred name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => username = val,
                ),
                SizedBox(height: 10),
                MyTextField(
                  keyboardType: TextInputType.phone,
                  labelText: 'Phone',
                  suffix: Icon(Icons.smartphone),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this is requaired feild';
                    }
                    if (RegExp(r'^7[7,8,1,3,0][0-9]{7}$').hasMatch(value)) {
                      return 'phone should be 9 digits and numbers only';
                    }
                    return null;
                  },
                  onSaved: (val) => phone = val,
                ),
                SizedBox(height: 10),
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
                      labelText: 'Choose delivery time'),
                  items: [
                    'Morning',
                    "Afternoon",
                    'Eveing',
                    'Night',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      time = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'this is requaired feild';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Text(
                  'Payment way',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                RadioListTile(
                    title: Text('Cash'),
                    value: 'cash',
                    activeColor: Colors.teal,
                    groupValue: paymentWay,
                    onChanged: (val) {
                      paymentWay = val!;
                      setState(() {});
                    }),
                RadioListTile(
                    title: Text('Alomqy'),
                    value: 'alomqy',
                    activeColor: Colors.teal,
                    groupValue: paymentWay,
                    onChanged: (val) {
                      paymentWay = val!;
                      setState(() {});
                    }),
                RadioListTile(
                    title: Text('Alkurimi'),
                    value: 'alkurimi',
                    activeColor: Colors.teal,
                    groupValue: paymentWay,
                    onChanged: (val) {
                      paymentWay = val!;
                      setState(() {});
                    }),
                TextField(
                  onSubmitted: (val) => notes = val,
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Notes'),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 60,
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          if(validateAndSave()){
                            Navigator.pushReplacementNamed(context, '/afterOrder');
                            }
                        },
                        child: Text(
                          'Order',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
