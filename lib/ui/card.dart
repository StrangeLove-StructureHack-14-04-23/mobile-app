import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/utils/app_colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.name,
      required this.role,
      // required this.imageUrl,
      required this.phone,
      required this.telegram,
      required this.vk});

  final String name;
  final String role;
  // final Image image;
  final String phone;
  final String telegram;
  final String vk;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 178,
      decoration: BoxDecoration(
        color: AppColors.color303030,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 65,
                  width: 196,
                  decoration: BoxDecoration(
                      color: AppColors.color515151,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 19,
                            ),
                            InkWell(
                                child: Text(
                              phone,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ))
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.telegram),
                            SizedBox(
                              width: 19,
                            ),
                            InkWell(
                                child: Text(
                              telegram,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ))
                          ],
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.vpn_key),
                            SizedBox(
                              width: 19,
                            ),
                            InkWell(
                                child: Text(
                              vk,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 88,
              height: 132,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                'https://img.freepik.com/free-photo/businessman-with-laptop_1368-9356.jpg?t=st=1681580217~exp=1681580817~hmac=f6bbfa141bbd3071d85a3d90b01434ab4471f26277796abd4f50d386d2a96de7',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
