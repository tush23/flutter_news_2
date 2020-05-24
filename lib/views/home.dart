import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutternews2/configer/configer_bloc.dart';
import 'package:flutternews2/configer/index.dart';
import 'package:flutternews2/custom/custom_Scaffold.dart';
import 'package:flutternews2/helper/news.dart';
import 'package:flutternews2/models/ArticleModel.dart';
import 'package:flutternews2/models/category_model.dart';
import 'package:flutternews2/models/source_model.dart';
import 'package:flutternews2/utils/constants.dart';
import 'package:flutternews2/utils/sortBy.dart';
import 'package:flutternews2/views/category_news.dart';
import 'package:flutternews2/views/search_tile.dart';
import 'package:flutternews2/views/source_news.dart';
import 'package:geolocator/geolocator.dart';

import 'news_tile.dart';

class Home extends StatefulWidget {
  List<CategoryModel> categoryy = new List<CategoryModel>();
  List<SourceModel> sourceData = List<SourceModel>();

  //bool _loading = true;

  @override
  _HomeState createState() => _HomeState();

  Home(this.categoryy, this.sourceData);
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles = new List<ArticleModel>();

  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  String sortBy = 'publishedAt';
  bool _loading = true;
  bool internt = true;

  @override
  void initState() {
    super.initState();
    getNews(sortBy);
    _getCurrentLocation();
    setState(() {
      _loading = false;
    });
    internetCheck();
  }

  /*getNews(String sortBy) async{
    News newsClass = News();
    await newsClass.getNews(sortBy,source);
    articles = newsClass.mNews;
    setState(() {
      _loading=false;
    });
    //source = newsClass.mSources;
    //print(articles.toString()+"\\"+source.toString());
  }*/

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    //getNews(sortBy);
  }

  internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // I am connected to a mobile network.
      internt = false;
    }
  }

  getNews(String sort) async {
    News newsClass = News();
    await newsClass.getNews(sort);
    articles = newsClass.mNews;
    //print(articles);
    setState(() {
      _loading = false;
      this.articles = newsClass.mNews;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      this.articles = articles;
    });
    return CustomScaffold(
      floatingButton: FloatingActionButton(
        backgroundColor: ConfigerBloc().darkModeOn ? Colors.blue : Colors.black,
        elevation: 4,
        child: const Icon(Icons.search),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchTile()),
          );
        },
      ),
      bottomTabs: BottomAppBar(
        color: ConfigerBloc().darkModeOn ? Colors.grey[900] : Colors.white,
        notchMargin: 5,
        elevation: 5,
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: _onMenuPressed,
            ),
          ],
        ),
      ),
      title: Constants.app_name,
      body: _loading
          ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              //CustomDropDown(mSourceList: widget.sourceData,),
              //Caegories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.categoryy.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageUrl: widget.categoryy[index].imageUrl,
                        categoryName:
                        widget.categoryy[index].categoryName,
                      );
                    }),
              ),

              //Blogs
              articles.isEmpty ? Center(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * .25),
                  child: CircularProgressIndicator() /*Text("Check Internet",style: TextStyle(fontSize: 20),)*/,
                ),
              ) : Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView.builder(
                    itemCount: this.articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                          imageURL: articles[index].urlToImage,
                          title: articles[index].title,
                          articleURL: articles[index].url,
                          publishedAt: articles[index].publishedAt,
                          author: articles[index].author,
                          disc: articles[index].description,
                          sourceName: articles[index].sourceName);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _onMenuPressed() {
    setState(() {
      showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Container(
            color: ConfigerBloc().darkModeOn ? Colors.black : Color(0xFF737373),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 5,
                        color: ConfigerBloc().darkModeOn ? Colors.white : Colors
                            .black,
                        offset: Offset(1, 3))
                  ], // make rounded corner of border,
                  color: Theme
                      .of(context)
                      .canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                /*decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.white,style: BorderStyle.solid))),
               */
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.category),
                      title: Text("Source"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SourceNews(widget.sourceData)),
                        );
                      },
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text("Popularity"),
                      onTap: () {
                        getNews(SortBy.Popularity);
                        Navigator.pop(context);
                        print("Popularity");
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text("Relevence"),
                      onTap: () {
                        getNews(SortBy.Relevancy);
                        Navigator.pop(context);
                        print("Relevancy");
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text("Published At"),
                      onTap: () {
                        articles.clear();
                        getNews(SortBy.Published);
                        print("PublishedAT");
                        Navigator.pop(context);
                      },
                    ),
                    //Divider(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Updater(String sort) {
    setState(() {
      Navigator.pop(context);
      //getNews(sort);
    });
  }

  _getCurrentLocation() {
    print('_getCurrentLocation');
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    print('_getAddressFromLatLng');
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
      print("&&&&&" + _currentAddress);
    } catch (e) {
      print(e);
    }
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CategoryNews(
                      category: categoryName.toString().toLowerCase())),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 60,
                  width: 120,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                categoryName,
                style:
                TextStyle(color: Colors.white, fontFamily: 'Product Sans'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
