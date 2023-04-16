import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/app_routes.dart';
import 'bloc/profile_bloc.dart';
import '../../service/api_requests.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import 'bloc/profile_bloc.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({super.key});
  
  
  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  XFile? _portreit;
  final authService = Injector().get<AuthService>();
  final String username = 'Admin31';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(authService: authService),
      child: Scaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLogoutState) {
              context.go(Routes.welcome);
            }
          },

          builder: (context, state) { return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xffdddddd),
                        image: const DecorationImage(
                                image: AssetImage('assets/images/vCard-page/Kate.png'),
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                          setState(() {
                            _portreit = image;
                          });
                        },
                        child: const Text('Изменить фото', style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Личные данные', style: TextStyle(
                          color: Color.fromARGB(122, 66, 133, 244),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Имя', style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text('Екатерина', style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xff999999),
                      height: 1,
                    ),
                    const SizedBox(height: 20,),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Фамилия', style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text('Новикова', style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xff999999),
                      height: 1,
                    ),
                    const SizedBox(height: 20,),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Дата рождения', style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text('7 апреля 2000г.', style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xff999999),
                      height: 1,
                    ),
                    const SizedBox(height: 20,),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Номер телефона', style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text('+7 946 7597 75 87', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xff999999),
                      height: 1,
                    ),
                    const SizedBox(height: 20,),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Социальные сети', style: TextStyle(
                              color: Color.fromARGB(122, 66, 133, 244),
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                            ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Telegram', style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text('http://t.me/proemel', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xff999999),
                      height: 1,
                    ),
                    const SizedBox(height: 20,),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Вконтакте', style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text('vk.com/KateNovic', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xff999999),
                      height: 1,
                    ),
                    const SizedBox(height: 20,),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Эл.почта', style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),),
                        Text('kate@strangelove.ru', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xff999999),
                      height: 1,
                    ),
                    const SizedBox(height: 20,),
            
            
                    
                    const SizedBox(height: 35,),
                    Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff1790FF),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          context.go(Routes.editor);
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          child: Center(
                            child: Text('Моя визитка', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // color: Color(0xff1790FF),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          // context.pop();
                          context.read<ProfileBloc>().add(ProfileLogoutEvent());
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          child: Center(
                            child: Text('Выйти', style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // color: Color(0xff1790FF),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          // context.pop();
                          context.read<ProfileBloc>().add(ProfileLogoutEvent());
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          child: const Center(
                            child: Text('Удалить аккаунт', style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],)
                  ),
              ),
            ));
  }),
      ),
    );
  }
}