import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';


import '../../model/bbc-model.dart';

class BbcScreen extends StatefulWidget {
  const BbcScreen({super.key});

  @override
  State<BbcScreen> createState() => _BbcScreenState();
}

class _BbcScreenState extends State<BbcScreen> {

  @override
  Widget build(BuildContext context) {
    final news = context.read<BbcCubit>();
    return BlocConsumer<BbcCubit,BbcState>(
        builder: (context,state){
          return Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: (){
                  if(context.locale.languageCode == 'en'){
                    context.setLocale(Locale('ar'));
                  }else{
                    context.setLocale(Locale('en'));
                  }
                },
            child: Icon(Icons.wordpress),
            ),
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('bbc'.tr(),style: TextStyle(color: Colors.white),),
                  Text('news'.tr(),style: TextStyle(color: Colors.black),)
                ],),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // state is DataTrump || news.bbcModel!=null?  Container(
                  //   height: 200,
                  //   child: ListView.builder(
                  //       itemCount: news.bbcModel!.articles!.length,
                  //       scrollDirection: Axis.horizontal,
                  //       shrinkWrap: true,
                  //       physics: BouncingScrollPhysics(),
                  //       itemBuilder: (context,index){
                  //         return Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  //           child: InkWell(
                  //             onTap: (){
                  //               _launchUrl(Uri.parse(news.bbcModel!.articles![index].url.toString()));
                  //             },
                  //             child: Container(
                  //               height: 150,
                  //               width: 150,
                  //               child: Image.network(news.bbcModel!.articles![index].urlToImage.toString(),
                  //               errorBuilder: (context, error ,StackTrace){
                  //                 return Image.asset('assets/electro.png');
                  //               }
                  //               ),
                  //             ),
                  //           )
                  //         );
                  //       }),
                  // ):SizedBox(),
                  // SizedBox(height: 20,),

                  // lang en ar
                  state is DataReach?  ListView.builder(
                      itemCount: news.bbcModel!.articles!.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: ListTile(
                            onTap: (){
                              _launchUrl(Uri.parse(news.bbcModel!.articles![index].url.toString()));
                            },
                            leading: Image.network(news.bbcModel!.articles![index].urlToImage.toString()),
                            title: Text(news.bbcModel!.articles![index].title.toString()),
                            subtitle: Text(news.bbcModel!.articles![index].description.toString()),
                          ),
                        );
                      }):Center(
                    child: CircularProgressIndicator(color: Colors.red,),
                  ),
                ],
              ),
            ),
          );
        }, listener: (context,state){});
  }
  Future<void> _launchUrl(dynamic url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
