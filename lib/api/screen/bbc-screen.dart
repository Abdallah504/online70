import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online70/api/logic/bbc_cubit.dart';

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
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('BBC',style: TextStyle(color: Colors.white),),
                  Text('News',style: TextStyle(color: Colors.black),)
                ],),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  state is DataTrump || news.trumpModel!=null?  Container(
                    height: 200,
                    child: ListView.builder(
                        itemCount: news.trumpModel!.articles!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.network(news.trumpModel!.articles![index].urlToImage.toString(),
                              errorBuilder: (context, error ,StackTrace){
                                return Image.asset('assets/electro.png');
                              }
                              ),
                            )
                          );
                        }),
                  ):SizedBox(),
                  SizedBox(height: 20,),
                  state is DataReach || news.bbcModel!=null?  ListView.builder(
                      itemCount: news.bbcModel!.articles!.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: ListTile(
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
}
