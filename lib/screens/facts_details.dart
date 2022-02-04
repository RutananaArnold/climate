import 'package:flutter/material.dart';

class FactsDetails extends StatelessWidget {
  final String sender;
  final String time;
  final String subject;
  final String message;
  final String imageUrl;

  const FactsDetails(
      {Key? key,
      required this.sender,
      required this.time,
      required this.subject,
      required this.message,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: ListView(
          children: [
            Center(
                child: Text(
              subject,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Center(child: Text(sender + " -- " + time))),
                Expanded(
                    child: AspectRatio(
                        aspectRatio: 2, child: Image.asset(imageUrl)))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
