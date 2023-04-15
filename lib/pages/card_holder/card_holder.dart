import 'package:flutter/material.dart';

class CardHolderPage extends StatelessWidget {
  const CardHolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 300,
                  height: 50,
                  color: Colors.red,
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
