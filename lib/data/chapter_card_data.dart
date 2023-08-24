class ChapterCardModel {
  String? name;
  String? tag;
  int? chapterNumber;
  Function()? press;
  ChapterCardModel({
    this.name,
    this.tag,
    this.chapterNumber,
    this.press,
  });
}

final chapterCardData = [
  ChapterCardModel(
    name: "Money",
    chapterNumber: 1,
    tag: "Life is about change",
    press: () {},
  ),
  ChapterCardModel(
    name: "Power",
    chapterNumber: 2,
    tag: "Everything loves power",
    press: () {},
  ),
  ChapterCardModel(
    name: "Influence",
    chapterNumber: 3,
    tag: "Influence easily like never before",
    press: () {},
  ),
  ChapterCardModel(
    name: "Win",
    chapterNumber: 4,
    tag: "Winning is what matters",
    press: () {},
  ),
];
