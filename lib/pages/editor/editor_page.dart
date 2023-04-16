import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_app/utils/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';

List<Color> getThemeCardColor({required index}){
  if (index==0){
    return <Color>[
              Color(0xdd303030),
              Color(0xdd696969),
            ];
  }
  else if (index==1){
    return <Color>[
            Color(0xddeaeaea),
            Color(0xddacacac),
          ];
  }
  else if (index==2){
    return <Color>[
            Color(0xddF0AA6A),
            Color(0xddA3662E),
          ];
  }
  else if (index==3){
    return <Color>[
            Color(0xdd6471E4),
            Color(0xdd2835A1),
          ];
  }
  else {
    return <Color>[
            Color(0xddfff0bb),
            Color(0xddbeaa65),
          ];
  }
}


// colors: <Color>[
//         Color(0xdd303030),
//         Color(0xdd696969),
//       ],

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  static int themeCardIndex = 0;
  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FCFF),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Column(children: [
            const SizedBox(height: 32,),
            const Text('Создание визитки', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 52,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Темы', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),),
            ],),
            const SizedBox(height: 5,),
            Row(children: [
              Container(
                decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xdd303030),
                          Color(0xdd696969),
                        ], 
                      ),
                      ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        EditorPage.themeCardIndex = 0;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 83,
                      
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 18,),
              Container(
                decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xddeaeaea),
                          Color(0xddacacac),
                        ], 
                      ),
                      ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        EditorPage.themeCardIndex = 1;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 83,
                      
                    ),
                  ),
                ),
              )
            ],),
            const SizedBox(height: 10,),
            Row(children: [
              Container(
                decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xddF0AA6A),
                          Color(0xddA3662E),
                        ], 
                      ),
                      ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        EditorPage.themeCardIndex = 2;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 83,
                      
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 18,),
              Container(
                decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xdd6471E4),
                          Color(0xdd2835A1),
                        ], 
                      ),
                      ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        EditorPage.themeCardIndex = 3;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 83,
                      
                    ),
                  ),
                ),
              )
            ],),
            const SizedBox(height: 10,),
            Row(children: [
              Container(
                decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xddfff0bb),
                          Color(0xddbeaa65),
                        ], 
                      ),
                      ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        EditorPage.themeCardIndex = 4;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 83,
                      
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 18,),
              Container(
                width: 150,
                height: 83,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Color(0x77000000))
                ),
                child: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text('Оформите подписку, чтобы открыть больше', style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0x77000000)
                      ),
                      textAlign: TextAlign.center,),
                ),
              )
            ],),
            const Divider(
              height: 30,
              thickness: 1,
              color: Color(0x33000000),
            ),
            Container(
                // width: 150,
                height: 178,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: getThemeCardColor(index: EditorPage.themeCardIndex),
                ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Специальность', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700, 
                          color: Colors.white
                        ),),
                        SizedBox(height: 3,),
                        Text('ФИО', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400, 
                          color: Colors.white
                        ),),
                        SizedBox(height: 15,),
                        DottedBorder(
                          color: Color(0xffaaaaaa),
                          // strokeWidth: 2,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          padding: EdgeInsets.all(6),
                          dashPattern: [6],
                          child: Container(
                            height: 65,
                            width: 170,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(children: [
                              Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.phone,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 19,
                                ),
                                DottedLine(
                                  direction: Axis.horizontal,
                                  lineLength: 100,
                                  lineThickness: 1.0,
                                  dashLength: 6.0,
                                  dashColor: Colors.grey,
                                  dashRadius: 0.0,
                                  dashGapLength: 6.0,
                                  dashGapColor: Colors.transparent,
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(Icons.telegram, color: Colors.white,size: 15),
                                SizedBox(
                                  width: 19,
                                ),
                                DottedLine(
                                  direction: Axis.horizontal,
                                  lineLength: 100,
                                  lineThickness: 1.0,
                                  dashLength: 6.0,
                                  dashColor: Colors.grey,
                                  dashRadius: 0.0,
                                  dashGapLength: 6.0,
                                  dashGapColor: Colors.transparent,
                                )
                              ],
                            ),
                            const SizedBox(height: 6,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(Icons.message, color: Colors.white, size: 15,),
                                SizedBox(
                                  width: 19,
                                ),
                                DottedLine(
                                  direction: Axis.horizontal,
                                  lineLength: 100,
                                  lineThickness: 1.0,
                                  dashLength: 6.0,
                                  dashColor: Colors.grey,
                                  dashRadius: 0.0,
                                  dashGapLength: 6.0,
                                  dashGapColor: Colors.transparent,
                                )
                              ],
                            ),
                            ]),
                          ),
                        ),
                      ],),
                      const SizedBox(width: 10,),
                      DottedBorder(
                          color: Color(0xffaaaaaa),
                          // strokeWidth: 2,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          padding: EdgeInsets.all(6),
                          dashPattern: [6],
                          child: Container(
                            height: 132,
                            width: 75,
                          ),
                        ),
                  ],),
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff1790FF),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      width: 300,
                      height: 50,
                      child: Center(
                        child: Text('Добавить информацию', style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70,)
          ],)),
        ),
      )),
    );
  }
}