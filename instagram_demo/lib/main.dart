import 'package:flutter/material.dart';
import 'sample.dart';

void main() {
  runApp(const MyApp());
}

int phot = photos.length;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Data data = new Data();
  bool good = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'ghiblipics',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_to_photos)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.zero,
                                title: Image.network(
                                    'https://www.be-en.co.jp/upload/save_image/1113195626_5fae665acacca.jpg'),
                              );
                            });
                      },
                      child: const CircleAvatar(
                        radius: 35.0,
                        backgroundImage: NetworkImage(
                            'https://www.be-en.co.jp/upload/save_image/1113195626_5fae665acacca.jpg'),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$phot',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '投稿',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    '1.4万',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'フォロワー',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    '10人',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'フォロー',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: const [
                      Text(
                        'Ghibli Studios ジブリ·スタジオ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: const [
                      Text(
                        'Daily pictures all about Ghibli studios',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  //color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(140, 30),
                            backgroundColor: Colors.white.withOpacity(0.1)),
                        onPressed: () {},
                        child: const Text(
                          'プロフィールを編集',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(140, 30),
                            backgroundColor: Colors.white.withOpacity(0.1)),
                        onPressed: () {},
                        child: const Text(
                          'プロフィールをシェア',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(5, 30),
                            backgroundColor: Colors.white.withOpacity(0.1)),
                        onPressed: () {},
                        child: const Icon(
                          Icons.person_add,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.grid_on,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.assignment_ind,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 3,
                  children: <Widget>[
                    for (var photo in data.getPhotosMap().entries) ...{
                      //ここにウィジェット置けるなら要素を切り出したwidgetを作ってrequiredつけて画像のパスをリストに入れてiで回せば綺麗？
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                title: Image.network(
                                  photo.value,
                                  fit: BoxFit.cover,
                                ),
                                content: Container(
                                  color: Colors.black,
                                  height: 120,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                          Icon(
                                            Icons.chat_bubble_outline,
                                            color: Colors.white,
                                          ),
                                          Icon(
                                            Icons.send,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Icon(
                                            Icons.bookmark_border,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'いいね！ : 他24人',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'gihiblipics',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              photo.key,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'コメントn件を表示',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1月1日',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(photo.value),
                              fit: BoxFit.cover,
                            ),
                            //color: Colors.red,
                          ),
                        ),
                      ),
                    }
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.slideshow,
                color: Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
