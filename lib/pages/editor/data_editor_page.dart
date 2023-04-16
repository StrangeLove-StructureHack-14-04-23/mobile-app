import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/app_routes.dart';

class DataRedactorPage extends StatefulWidget {
  const DataRedactorPage({super.key});

  @override
  State<DataRedactorPage> createState() => _DataRedactorPageState();
}

class _DataRedactorPageState extends State<DataRedactorPage> {
  XFile? _portreit;
  TextEditingController _textName = TextEditingController();
  TextEditingController _textLastName = TextEditingController();
  TextEditingController _textBurthday = TextEditingController();

  TextEditingController _textPhone = TextEditingController();
  TextEditingController _textTg = TextEditingController();
  TextEditingController _textVk = TextEditingController();

  TextEditingController _textEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xffdddddd),
                  image: DecorationImage(
                    image: AssetImage('assets/images/vCard-page/anon.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    final XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {
                      _portreit = image;
                    });
                  },
                  child: Text(
                    'Добавить фото',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Личные данные',
                    style: TextStyle(
                        color: Color.fromARGB(122, 66, 133, 244),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _textName,
                decoration: const InputDecoration(
                  hintText: 'Имя',
                  // labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                // textAlign: TextAlign.end,
                // validator: (String? value) {
                //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                // },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _textLastName,
                decoration: const InputDecoration(
                  hintText: 'Фамилия',
                  // labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                // textAlign: TextAlign.end,
                // validator: (String? value) {
                //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                // },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _textBurthday,
                decoration: const InputDecoration(
                  hintText: 'Дата рождения',
                  // labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                // textAlign: TextAlign.end,
                // validator: (String? value) {
                //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                // },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _textPhone,
                decoration: const InputDecoration(
                  hintText: 'Номер телефона',
                  // labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                // textAlign: TextAlign.end,
                // validator: (String? value) {
                //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                // },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Социальные сети',
                    style: TextStyle(
                        color: Color.fromARGB(122, 66, 133, 244),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _textTg,
                decoration: const InputDecoration(
                  hintText: 'Telegram',
                  // labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                // textAlign: TextAlign.end,
                // validator: (String? value) {
                //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                // },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _textVk,
                decoration: const InputDecoration(
                  hintText: 'ВКонтакте',
                  // labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                // textAlign: TextAlign.end,
                // validator: (String? value) {
                //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                // },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _textEmail,
                decoration: const InputDecoration(
                  hintText: 'Эл.почта',
                  // labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                // textAlign: TextAlign.end,
                validator: (String? value) {
                  return (value != null && !value.contains('@'))
                      ? 'Use the @ char.'
                      : null;
                },
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff1790FF),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Готово',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Color(0xff1790FF),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Выйти',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      )),
    );
  }
}
