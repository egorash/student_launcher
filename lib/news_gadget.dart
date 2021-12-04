import 'package:flutter/material.dart';
import 'package:newsapi/newsapi.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsGadget extends StatefulWidget {
  const NewsGadget({Key? key}) : super(key: key);

  @override
  _NewsGadgetState createState() => _NewsGadgetState();
}

class _NewsGadgetState extends State<NewsGadget> {
  var newsApi = NewsApi(
    apiKey: 'foo',
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNews(),
      builder:
          ((BuildContext context, AsyncSnapshot<ArticleResponse> snapshot) {
        if (snapshot.hasData) {
          ArticleResponse? resp = snapshot.data;
          return SizedBox(
            height: 340,
            child: ListView.builder(
                itemCount: resp!.articles!.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    onTap: (() {
                      _launchURL(resp.articles!.elementAt(index).url);
                    }),
                    title: Text(resp.articles!.elementAt(index).title),
                  );
                })),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Future<ArticleResponse> getNews() async {
    var result = await newsApi.topHeadlines(
      country: 'us',
      language: 'en',
      pageSize: 5,
    );
    return result;
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
