import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      KameraEkrani(),
      SohbetEkrani(),
      DurumEkrani(),
      AramaEkrani(),
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.camera_alt)),
      Tab(icon: null, text: "SOHBETLER"),
      Tab(icon: null, text: 'DURUM'),
      Tab(icon: null, text: 'ARAMALAR'),
    ];
    return DefaultTabController(
      initialIndex: 1,
      length: _kTabs.length,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelPadding: EdgeInsets.only(left: 20.0, right: 20.0),
              isScrollable: true,
              tabs: _kTabs,
            ),
            backgroundColor: Colors.teal[900],
            title: Text("Whatsapp"),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: null),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("Yeni grup"),
                    ),
                    PopupMenuItem(
                      child: Text("Yeni toplu mesaj"),
                    ),
                    PopupMenuItem(
                      child: Text("Bağlı cihazlar"),
                    ),
                    PopupMenuItem(
                      child: Text("Yıldızlı mesajlar"),
                    ),
                    PopupMenuItem(
                      child: Text("Ayarlar"),
                    ),
                  ];
                },
              ),
            ],
          ),
          body: TabBarView(
            children: _kTabPages,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal[400],
            onPressed: null,
            child: Icon(Icons.message),
          ),
        ),
      ),
    );
  }
}

class SohbetEkrani extends StatefulWidget {
  @override
  _SohbetEkraniState createState() => _SohbetEkraniState();
}

class _SohbetEkraniState extends State<SohbetEkrani> {
  int _sayi = 30;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _sayi,
      padding: EdgeInsets.all(2.0),
      itemBuilder: (BuildContext context, index) {
        return (_sayi != 0)
            ? ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      "https://blog.fotografium.com/wp-content/uploads/2011/08/stock-photo-118031755-768x512.jpg"),
                ),
                title: Text("İsim Soyisim"),
                subtitle: Text("Gelen Mesaj İçeriği Tam Burada Bulunuyor."),
                trailing: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Center(
                      child: Text(
                    "1",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  )),
                ),
              )
            : Text("Kimse Yok Hacı");
      },
    );
  }
}

class DurumEkrani extends StatefulWidget {
  @override
  _DurumEkraniState createState() => _DurumEkraniState();
}

class _DurumEkraniState extends State<DurumEkrani> {
  int _sayi = 4;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://blog.fotografium.com/wp-content/uploads/2011/08/stock-photo-118031755-768x512.jpg"),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 4.0,
                    ),
                  ),
                ),
                title: Text(
                  "Durumum",
                ),
                subtitle: Text("Durum güncellemesi eklemek için dokunun"),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, top: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Görülen Güncellemeler",
                  textAlign: TextAlign.left,
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _sayi,
                padding: EdgeInsets.all(2.0),
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://blog.fotografium.com/wp-content/uploads/2011/08/stock-photo-118031755-768x512.jpg"),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 4.0,
                        ),
                      ),
                    ),
                    title: Text(
                      "İsim Soyisim",
                    ),
                    subtitle: Text("Dün 15:42"),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*

            ListTile(
              leading: Container(
                width: 50.0,
                height: 50.0,
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://blog.fotografium.com/wp-content/uploads/2011/08/stock-photo-118031755-768x512.jpg"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(
                    color: Colors.grey,
                    width: 4.0,
                  ),
                ),
              ),
              title: Text(
                "Durumum",
              ),
              subtitle: Text("Durum güncellemesi eklemek için dokunun"),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, top: 10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Görülen Güncellemeler",
                textAlign: TextAlign.left,
              ),
            ),


ListView.builder(
      itemCount:_sayi,
      padding: EdgeInsets.all(2.0),
      itemBuilder: (BuildContext context,index){
        return ListTile(
          leading: Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://blog.fotografium.com/wp-content/uploads/2011/08/stock-photo-118031755-768x512.jpg"),
              ),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              border: Border.all(color: Colors.grey,width: 4.0,),
            ),
          ),
          title: Text("İsim Soyisim",),
          subtitle: Text("Dün 15:42"),
        );
      },
    );
 */

class AramaEkrani extends StatefulWidget {
  @override
  _AramaEkraniState createState() => _AramaEkraniState();
}

class _AramaEkraniState extends State<AramaEkrani> {
  int _sayi=30;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _sayi,
      padding: EdgeInsets.all(2.0),
      itemBuilder: (BuildContext context, index) {
        return (_sayi != 0)
            ? ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                "https://blog.fotografium.com/wp-content/uploads/2011/08/stock-photo-118031755-768x512.jpg"),
          ),
          title: Text("İsim Soyisim"),
          subtitle: Text("Dün 22:38"),
          trailing: Container(
            width: 20.0,
            height: 20.0,
            child: Center(
                child: Icon(Icons.call,color: Colors.teal[900],),
            ),
          ),
        )
            : Text("Kimse Yok Hacı");
      },
    );
  }
}

class KameraEkrani extends StatefulWidget {
  @override
  _KameraEkraniState createState() => _KameraEkraniState();
}

class _KameraEkraniState extends State<KameraEkrani> {
  File _image;

  void initState() {
    getImage(ImageSource.camera);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_image != null) ? Image.file(_image) : Placeholder();
    /*RaisedButton(
      onPressed:(){
        getImage(ImageSource.camera);
      },
      child: Text(
        "Aç"
      ),
    );*/
  }

  void getImage(ImageSource source) async {
    print("getImageFromGallery");
    var image = await ImagePicker.pickImage(source: source);

    setState(() {
      _image = image;
    });
  }
}

/*


  final _kTabs = <Tab>[
    Tab(
      child: Icon(
        Icons.camera,
      ),
    ),
    Tab(
      child: Text("SOHBETLER"),
    ),
    Tab(
      child: Text("DURUM"),
    ),
    Tab(
      child: Text("ARAMALAR"),
    ),
  ];

  final _kTabPages = [
    Text("kamera"),
    Text("sohbet"),
    Text("durum"),
    Text("arama")
  ];

appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: Text("Whatsapp"),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Yeni grup"),
                  ),
                  PopupMenuItem(
                    child: Text("Yeni toplu mesaj"),
                  ),
                  PopupMenuItem(
                    child: Text("Bağlı cihazlar"),
                  ),
                  PopupMenuItem(
                    child: Text("Yıldızlı mesajlar"),
                  ),
                  PopupMenuItem(
                    child: Text("Ayarlar"),
                  ),
                ];
              },
            ),
          ],
        ),


 */
