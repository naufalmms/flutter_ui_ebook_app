import 'package:flutter/material.dart';
import 'package:flutter_ui_ebook_app/data/chapter_card_data.dart';

import '../constant.dart';
import '../widgets/book_rating.dart';
import '../widgets/rounded_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                    top: size.height * .12,
                    left: size.width * .1,
                    right: size.width * .02,
                  ),
                  height: size.height * .48,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: BookInfo(
                    size: size,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .48 - 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: chapterCardData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ChapterCard(
                            chapterCardModel: chapterCardData[index],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineSmall,
                      children: const [
                        TextSpan(
                          text: "You might also ",
                        ),
                        TextSpan(
                          text: "like….",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      const SizedBox(
                        height: 180,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 24, top: 24, right: 150),
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: const Color(0xFFFFF8F9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: kBlackColor),
                                  children: [
                                    TextSpan(
                                      text:
                                          "How To Win \nFriends & Influence \n",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Gary Venchuk",
                                      style: TextStyle(color: kLightBlackColor),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const BookRating(
                                    score: 4.9,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: RoundedButton(
                                      text: "Read",
                                      verticalPadding: 10,
                                      press: () {},
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          "assets/images/book-3.png",
                          width: 150,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChapterCard extends StatelessWidget {
  ChapterCardModel chapterCardModel;

  ChapterCard({
    Key? key,
    required this.chapterCardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Align(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        margin: const EdgeInsets.only(bottom: 16),
        width: size.width - 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(38.5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 33,
              color: const Color(0xFFD3D3D3).withOpacity(.84),
            ),
          ],
        ),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Chapter ${chapterCardModel.chapterNumber}:${chapterCardModel.name!}\n",
                    style: const TextStyle(
                      fontSize: 16,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: chapterCardModel.tag,
                    style: const TextStyle(color: kLightBlackColor),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onPressed: chapterCardModel.press,
            )
          ],
        ),
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  final Size size;

  const BookInfo({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Crushing &",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 28),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * .005),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 0),
                    child: const Text(
                      "Influence",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * .3,
                            padding: EdgeInsets.only(top: size.height * .02),
                            child: const Text(
                              "When the earth was flat andeveryone wanted to win the gameof the best and people and winning with an A game with all the things you have.",
                              maxLines: 5,
                              style: TextStyle(
                                fontSize: 10,
                                color: kLightBlackColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.height * .015),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),

                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 15),
                                    blurRadius: 30,
                                    color: const Color(0xFF666666)
                                        .withOpacity(.11),
                                  ),
                                ],
                              ),
                              child: const Text(
                                "Read",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // child: FlatButton(
                            //   onPressed: () {},
                            //   child: Text(
                            //     "Read",
                            //     style: TextStyle(fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              size: 20,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                          const BookRating(score: 4.9),
                        ],
                      )
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Image.asset(
                  "assets/images/book-1.png",
                  height: double.infinity,
                  alignment: Alignment.topRight,
                  fit: BoxFit.fitWidth,
                ),
              )),
        ],
      ),
    );
  }
}
