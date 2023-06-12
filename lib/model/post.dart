class Post {
  Post({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
  });

  final String title;
  final String author;
  final String imageUrl;
  final String description;

  bool selected = false;
}

final List<Post> posts = [
  Post(
    title: '大谷翔平のデーゲーム打率が４割超えに　ミスター・ジューンも健在！６月打率は３割８分１厘',
    author: '米大リーグエンゼルス９―４マリナーズ（１１日・アナハイム＝エンゼル・スタジアム）',
    description: 'エンゼルス・大谷翔平投手（２８）が１１日（日本時間１２日）の本拠地・マリナーズ戦のスタメンに「２番・指名打者」で出場。３試合連続本塁打とはならなかったが、５打数３安打１三振で打率は２割８分７厘に上昇した。今季自身最長の８試合連続安打、２試合ぶりのマルチ安打で６月は３度目となる３安打以上をマーク。打撃内容は二ゴロ、右前安打、右前安打、見逃し三振、右前安打で、３安打はすべて右前に運んだ。',
    imageUrl: 'https://news-pctr.c.yimg.jp/t/news-topics/images/tpc/2023/6/12/98343dbe8698b634b23ea75c1ada254aa2339a1ea7f2449d5277944782c7a742.jpg',
  ),
  Post(
    title: '広末涼子夫は「けじめつけます」主演映画が延期にCM動画削除…迫りくる“最悪のシナリオ',
    author: '出典元:WEB女性自身',
    description: '6月7日に、フレンチレストラン「sio」のオーナーシェフ・鳥羽周作氏（45）とのW不倫疑惑が報じられた広末涼子（42）。「文春オンライン」の記事では関係者の証言を交え、既婚者同士である2人が6月3日夜に時間差で都内の高級ホテルを訪れる様子などを報じた。',
    imageUrl: 'https://img.jisin.jp/uploads/2023/06/hirosue_ryoko_furin12.jpg.webp',
  ),
  Post(
    title: '台風3号　今夜からあす13日明け方　伊豆諸島南部や小笠原諸島に接近　高波に警戒',
    author: '日直主任日本気象協会 本社日直主任',
    description: '台風3号は、今夜(12日)からあす13日明け方にかけて、伊豆諸島南部や小笠原諸島に接近する見込みです。伊豆諸島南部と小笠原諸島では次第に風が強まり、波が高くなるでしょう。うねりを伴う高波に警戒し、強風にご注意ください。',
    imageUrl: 'https://i-storage.tenki.jp/large/storage/static-images/forecaster_diary/image/2/23/236/23667/main/20230612071957/large.jpg',
  ),
  Post(
    title: 'star NASA',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC2MVCx6oblOD3jgAFw_I3YCcbyOqh30GPyQ&usqp=CAU',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/banner1920/potw1236a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/banner1920/heic2304a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/banner1920/heic2305a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb700x/heic2017a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb700x/heic2018b.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb700x/heic1307a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb700x/heic0406a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb700x/heic0910h.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb700x/heic1608a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/hubble_release2.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/heic0304e.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/heic2017c.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/heic1804a.jpg',
  ),Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/sa3.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/sa2.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/heic0715a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/opo0511a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/heic0905a.jpg',
  ),
  Post(
    title: 'Joong Dunk',
    author: 'star in my mind',
    description: '六月十日のデモです',
    imageUrl: 'https://cdn.spacetelescope.org/archives/images/thumb300y/potw1924a.jpg',
  ),
  
];