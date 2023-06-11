import 'package:flutter/material.dart';

import '../controller/contact_controller.dart';
import '../model/contact_model.dart';
import 'contact.dart';

class EditContact extends StatefulWidget {
  const EditContact({
    Key? key,
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
  }) : super(key: key);

  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? address;

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  var contactController = ContactController();
  final formkey = GlobalKey<FormState>();
  String? tempname;
  String? tempphone;
  String? tempmail;
  String? tempaddress;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update data'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF000000),
              Color(0xFF1A237E),
              Color(0xFF673AB7),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white
                  ),
                  onSaved: (value) {
                    tempname = value;
                  },
                  initialValue: widget.name,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white
                  ),
                  onSaved: (value) {
                    tempphone = value;
                  },
                  initialValue: widget.phone,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white
                  ),
                  onSaved: (value) {
                    tempmail = value;
                  },
                  initialValue: widget.email,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white
                  ),
                  onSaved: (value) {
                    tempaddress = value;
                  },
                  initialValue: widget.address,
                ),
                const SizedBox(height: 20),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor: MaterialStateProperty.all(Colors.white)
                        ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        ContactModel cm = ContactModel(
                            id: widget.id,
                            name: tempname!.toString(),
                            phone: tempphone!.toString(),
                            email: tempmail!.toString(),
                            address: tempaddress!.toString());
                        contactController.updateContact(cm);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Contact Changed')));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Contact(),
                          ),
                        );
                      }
                    },
                    child: Text('Edit'))
              ],
            ),
          ),
        )
      ),
    );
  }
}