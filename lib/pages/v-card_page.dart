import 'package:flutter/material.dart';
import 'package:mobile_app/utils/app_colors.dart';

class VCardPage extends StatelessWidget {
  const VCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color373737,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(child: 
              Column(children: [
                const SizedBox(height: 44,),
                Container(
                  width: 390,
                  height: 500,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/vCard-page/personEx.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    border: Border.all(
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.color303030,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Name:', 
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Age:', 
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Location:', 
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                        ),
                        const SizedBox(width: 14,),
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Tom Ethan', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            '19 y.o.', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Los-Angeles', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                        )
                    ]),
                  ),
                ),
                const SizedBox(height: 13,),
                Row(children: [
                  Expanded(
                    child: Container(
                      height: 110,
                      // width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.color00C399,
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('21', style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                            ),
                            Text('Clients', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                            ),
                          ],
                          ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Container(
                      height: 110,
                      // width: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('25', style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                            ),
                            Text('Projects', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                            ),
                          ],
                          ),
                      ),
                    ),
                  )
                ],),
                const SizedBox(height: 13,),
                Container(
                      height: 110,
                      // width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.colorFE6C7A,
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('2+', style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                          ),
                          const SizedBox(width: 20,),
                          Text('Years of Experience', style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                          ),
                        ],
                        ),
                    ),
                    const SizedBox(height: 40,)
              ]),
            ),
          ),
        ),
      )
      );
  }
}