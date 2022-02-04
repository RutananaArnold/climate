import 'package:agriculture_app/screens/facts_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:agriculture_app/models/facts.dart';

class FactsPage extends StatefulWidget {
  FactsPage({Key? key}) : super(key: key);

  @override
  State<FactsPage> createState() => _FactsPageState();
}

class _FactsPageState extends State<FactsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              var faq = ourFaqs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext contect) => FactsDetails(
                                sender: faq.sender,
                                time: faq.time,
                                subject: faq.subject,
                                message: faq.message,
                                imageUrl: faq.avatar,
                              )),
                      (route) => true);
                },
                child: Card(
                    margin: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      faq.sender + "  -  " + faq.time,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      faq.subject,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 40),
                                    ),
                                    Text(
                                      faq.message,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              child: AspectRatio(
                                  aspectRatio: 2,
                                  child: Image.asset(faq.avatar))),
                        ],
                      ),
                    )),
              );
            },
            childCount: ourFaqs.length,
          )),
        )
      ],
    );
  }
}
