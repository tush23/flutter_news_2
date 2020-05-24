import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews2/configer/index.dart';
import 'package:flutternews2/helper/dataCategory.dart';
import 'package:flutternews2/helper/news.dart';
import 'package:flutternews2/models/category_model.dart';
import 'package:flutternews2/models/source_model.dart';
import 'package:flutternews2/utils/constants.dart';
import 'package:flutternews2/views/home.dart';

class ConfigerPage extends StatefulWidget {
  @override
  _ConfigerPageState createState() => _ConfigerPageState();
}

class _ConfigerPageState extends State<ConfigerPage> {
  String source = '';
  String sortBy = 'publishedAt';
  bool _loading = true;

  ConfigerBloc _configerBloc;
  List<CategoryModel> categoryy = new List<CategoryModel>();

  //List<ArticleModel> articles = new List<ArticleModel>();
  List<SourceModel> sourceData = List<SourceModel>();

  @override
  void initState() {
    categoryy = getCategoryModel();
    print(categoryy);
    super.initState();
    getNews();
    /*Methods().getNews(sortBy, source);
    Methods().getSource();
    articles=Methods().articles;
    sourceData=Methods().sourceData;
    setState(() {
      articles=Methods().articles;
    });*/
    setupApp();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews(sortBy);
    //articles = newsClass.mNews;
    setState(() {
      _loading = false;
    });
    SourceInfo sourceInfo = SourceInfo();
    await sourceInfo.getSourceData();
    sourceData = sourceInfo.mSource;
    print("@@@@@@@@@@@@@@@@@@@@");
    print(sourceData);
    //print(articles.toString()+"\\"+source.toString());
    ConfigerBloc().add(DarkModeEvent(!ConfigerBloc().internetConnection));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _configerBloc,
      child: BlocBuilder(
          bloc: _configerBloc,
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'News',
              theme: ThemeData(
                fontFamily: Constants.google_sans_family,
                primarySwatch: Colors.red,
                primaryColor:
                    _configerBloc.darkModeOn ? Colors.black : Colors.white,
                disabledColor: Colors.grey,
                cardColor:
                    _configerBloc.darkModeOn ? Colors.black : Colors.white,
                canvasColor:
                    _configerBloc.darkModeOn ? Colors.black : Colors.green[50],
                brightness: _configerBloc.darkModeOn
                    ? Brightness.dark
                    : Brightness.light,
                buttonTheme: Theme.of(context).buttonTheme.copyWith(
                      colorScheme: _configerBloc.darkModeOn
                          ? ColorScheme.dark()
                          : ColorScheme.light(),
                    ),
                appBarTheme: AppBarTheme(elevation: 0.0),
              ),
              home: Home(categoryy, sourceData),
              routes: {},
            );
          }),
    );
  }

  void setupApp() {
    _configerBloc = ConfigerBloc();
    _configerBloc.darkModeOn =
        Constants.perfs.getBool(Constants.darkModeperf) ?? true;
  }
}
