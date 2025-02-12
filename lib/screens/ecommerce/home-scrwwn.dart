import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String>images = [
    'https://s3-alpha-sig.figma.com/img/b606/0706/4e4a496386b9ac88a130495134f0bd8c?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=h5l0o6AZczQL8pIBEPt8hQioAnQTiG~7qUn-RNbL~gXmNK4hP0-d5Q5KFDTKEMexaAIIW0MMilF2APr-XUezBD6BdXfGIkdeBNsyvYaMwtTje-w8AukgefX6tx9Y1nWe8Igyo5LYjghEPwTt1YQERMyqGJO5ASZPIk7dapDk0Jp9ChyAUwQ4~562pcWrR~0biLtrez~WdaKHFrcNQXVv7EVynviRLTBJAcihhs2iBINRB-iSZz9FBt8K2ovJeeJUgJRumQnjF762Kf~Xf9IddFWNwSYGXwp6OPP-JJW8oY0DO9h7E1PDccQaGL7iPDFWrGiPb22GkopnWKWWPRCZ7g__',
    'https://s3-alpha-sig.figma.com/img/03fc/7aec/87a6515421f3b9608d2c054631abaa6b?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PR7XwsmrRU8hRo2LjeWigBEdwrZzCxXy7RZatOOXvQT1bP60zVom9hicXvTfEcg6KxnIg9VhRV8kMIgrJKcFNof9lN5D612TiGd9~dpHY8god0vKtclb0wi9NDjr09p-bUsgexIrrEtPQMJQCKD20wYIzhsTTUuf7TGohLWnV-miDQBaWb7CrxbOCiOlyUqLiRSeMCasiWmcB2BPnwGuVzG9twjEJgsXVNMTMUFBkuPnGjYbihAErLTDAwQvbWzLPr3M70XMi14pKq8JD3ogzPT1ezp3B4m5rY7XzpbXVmgRs3XsuVLIGWJKt4FN~DfOO9eb5Nwecszsu4qU0dvgDQ__',
    'https://s3-alpha-sig.figma.com/img/c70c/eec1/4cddf5011f118e5ce001853e22f71199?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=V-biwDIuaVJKule6sRA1Yg3JvP2zZBGyH1MlAktRaKPdhhuG30vq09ACSZBEUMmDy83A-~GdKJ6L2heCSpCipm2QlUkaQobvmLjQzMAiyNrVa9AESGvVP5sEB-fzpyRX21oGxuyC02sSvkOUAN8ybJV-UmsPSdTF~NOt0L-3Ukv7Xv90yK21ezV8vJbbaQJMezjeq6MLL2YvRkAAR~jBCNZGHHf0cF-BQs82-593qJBTHowMsdRYtV0-09AmrI56byeZGqqywIHo9pYp~Tx43igt-2BXNKA5wl-8XxAaNr5aw~e6ZDz-ApqMgReZYTj1oxW6oX65vC8AVu6LwUkFAg__',
    'https://s3-alpha-sig.figma.com/img/213f/343f/e903ab02421d69fefe58bc17812dbd54?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=P8xs1Kd4evAaSZ8nbGpbh-zeS~Qv19efeANYlV0gqzAPEJ5QpH-2yoCaLQBmGEx12PvObyIGM-AxUzAQHAG7kjZ9KD-rgfXjDvWKUtiWMIf9EXGEPIFbaBsbXUFneuMt1o9b4LJEgylyA60~ciZXl3Hi-nrnWKEisMyNcofaFDLymZFD5fx~nSu98SzK9ZaOMtjjxBcBVzAfw8fElsCtWI~X8eewk-fyDriot~Ah86hUbOb~M6zcXe10iWBCbBY0IdqYlEsJnpDcnO~6V5AfMEwRxHP9g5C~WUnTajQ3HkHta18md~IpVg1QT4s57mIx20kKdKjBwY~niYxDs-3uPw__',
    'https://s3-alpha-sig.figma.com/img/b606/0706/4e4a496386b9ac88a130495134f0bd8c?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=h5l0o6AZczQL8pIBEPt8hQioAnQTiG~7qUn-RNbL~gXmNK4hP0-d5Q5KFDTKEMexaAIIW0MMilF2APr-XUezBD6BdXfGIkdeBNsyvYaMwtTje-w8AukgefX6tx9Y1nWe8Igyo5LYjghEPwTt1YQERMyqGJO5ASZPIk7dapDk0Jp9ChyAUwQ4~562pcWrR~0biLtrez~WdaKHFrcNQXVv7EVynviRLTBJAcihhs2iBINRB-iSZz9FBt8K2ovJeeJUgJRumQnjF762Kf~Xf9IddFWNwSYGXwp6OPP-JJW8oY0DO9h7E1PDccQaGL7iPDFWrGiPb22GkopnWKWWPRCZ7g__',
    'https://s3-alpha-sig.figma.com/img/03fc/7aec/87a6515421f3b9608d2c054631abaa6b?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PR7XwsmrRU8hRo2LjeWigBEdwrZzCxXy7RZatOOXvQT1bP60zVom9hicXvTfEcg6KxnIg9VhRV8kMIgrJKcFNof9lN5D612TiGd9~dpHY8god0vKtclb0wi9NDjr09p-bUsgexIrrEtPQMJQCKD20wYIzhsTTUuf7TGohLWnV-miDQBaWb7CrxbOCiOlyUqLiRSeMCasiWmcB2BPnwGuVzG9twjEJgsXVNMTMUFBkuPnGjYbihAErLTDAwQvbWzLPr3M70XMi14pKq8JD3ogzPT1ezp3B4m5rY7XzpbXVmgRs3XsuVLIGWJKt4FN~DfOO9eb5Nwecszsu4qU0dvgDQ__',
    'https://s3-alpha-sig.figma.com/img/c70c/eec1/4cddf5011f118e5ce001853e22f71199?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=V-biwDIuaVJKule6sRA1Yg3JvP2zZBGyH1MlAktRaKPdhhuG30vq09ACSZBEUMmDy83A-~GdKJ6L2heCSpCipm2QlUkaQobvmLjQzMAiyNrVa9AESGvVP5sEB-fzpyRX21oGxuyC02sSvkOUAN8ybJV-UmsPSdTF~NOt0L-3Ukv7Xv90yK21ezV8vJbbaQJMezjeq6MLL2YvRkAAR~jBCNZGHHf0cF-BQs82-593qJBTHowMsdRYtV0-09AmrI56byeZGqqywIHo9pYp~Tx43igt-2BXNKA5wl-8XxAaNr5aw~e6ZDz-ApqMgReZYTj1oxW6oX65vC8AVu6LwUkFAg__',
    'https://s3-alpha-sig.figma.com/img/213f/343f/e903ab02421d69fefe58bc17812dbd54?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=P8xs1Kd4evAaSZ8nbGpbh-zeS~Qv19efeANYlV0gqzAPEJ5QpH-2yoCaLQBmGEx12PvObyIGM-AxUzAQHAG7kjZ9KD-rgfXjDvWKUtiWMIf9EXGEPIFbaBsbXUFneuMt1o9b4LJEgylyA60~ciZXl3Hi-nrnWKEisMyNcofaFDLymZFD5fx~nSu98SzK9ZaOMtjjxBcBVzAfw8fElsCtWI~X8eewk-fyDriot~Ah86hUbOb~M6zcXe10iWBCbBY0IdqYlEsJnpDcnO~6V5AfMEwRxHP9g5C~WUnTajQ3HkHta18md~IpVg1QT4s57mIx20kKdKjBwY~niYxDs-3uPw__'
  ];
  int imageIndex = 0;
  void changeImageIndex(int index){
    setState(() {
      imageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Menu',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 50,
                  width: 50,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: Image.network('https://s3-alpha-sig.figma.com/img/d10d/9dbc/ca9b240701475efe9467f6997c8c18de?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=DwUfg8AWUh8r578PG2Y0Cn6HpoBwxA9Jg9toDAECSMZ3Q1SCaGTRpr~XtUM-y953MaZ4fPZnXmiYNSC2aBOAxJTt4Nl~g~onWQqdXQP7tJxKoj1fU6yJfsRgPblsWYcwwbguL9GRuJid7~ZASq6RGBCgzzRokI595-gTqB-craxeRfgaw0LvvFEBh72pPUW5l3HDVW7JkySBxMzSkm0lZAzW597v751pF3G2aZbf6-W7Z7df7zkl24eLzWyjEXej4GuySVwX4sq7FHdj~kBfbh6c3Lvg9mWA1JIwTZtCbiAfDbLlDgMyUe6cmeDhDAnVXS15uJ~X3x3d8vD8P7U~KQ__',fit: BoxFit.fill,),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      // Navigation or statemanagment
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.search,color: Colors.black,),
                        SizedBox(width: 15,),
                        Text('Search',style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  )
                ],
              ),

            ),

            SizedBox(height: 20,),

            Container(
              height: 100,
              //width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            changeImageIndex(index);
                          },
                          child: Container(
                            height: 60,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                color:imageIndex==index? Colors.purple:Colors.grey
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  //color: Colors.red
                                ),
                                child: Image.network(images[index]),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(height: 20,),
            Text('Promotions',style: TextStyle(fontSize: 24,color: Colors.black),),
            SizedBox(height: 10,),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,

                ),

                Container(
                  height: 190,
                  width: 400,

                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text('Today Offer',style: TextStyle(color: Colors.white,fontSize: 15),),
                        SizedBox(height: 5,),
                        Text('Free One Burger',style: TextStyle(color: Colors.white,fontSize: 20),),
                        SizedBox(height: 5,),
                        Text('On all orders above',style: TextStyle(color: Colors.white,fontSize: 15),),
                        SizedBox(height: 5,),
                        Text('150 EGP',style: TextStyle(color: Colors.white,fontSize: 15),)
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 90,
                  //top: 0,
                  //bottom: 0,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0,bottom: 50),
                        child: Image.network('https://s3-alpha-sig.figma.com/img/b7de/77e5/837dc16dd0b1f9af7140aaa3c9391b98?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=BxMpHH8Alry1-AYDzuEjAsA5e6lSDMNEtsN4FOwERLUYcQiDscj~PN-FCV7mAj5J7G0E8ZXjgzj14LcNr5OV~unw-aN5Fl8gv-HTQm6GpYRU6p1foEovrl2yqxVqhac87sHz1cyUuHE3XzFFa2F58grhdj859LueAfr1jyFUyf7asl6tvvlPz1IQXQvh2CD4icBKKmvoVeMzquM2cOsZHb74BluR~w86PtD3jqITPHSvbx8yzGHWhMo3FBS-bddT2UmjkOyE0MHeXCYvCunkVDz8aXCtb2rlGig4~3qAwtfKSK3sVhowe9eStB2CYzeianbLy61epKwuvDuCprt-8g__',
                          height: 250,
                        ),
                      )),
                )


              ],
            ),

            SizedBox(height: 20,),

            Text('Popular',style: TextStyle(color: Colors.black,fontSize: 20),),
            SizedBox(height: 10,),
            // GridView.builder(
            //     itemCount: images.length,
            //
            //     gridDelegate: gridDelegate, itemBuilder: itemBuilder)

            Container(
              height: 200,
              child: ListView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  //color: Colors.red
                                ),
                                child: Image.network(images[index],fit: BoxFit.fill,),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding:  EdgeInsets.only(left: 10),
                              child: Text('Food',style: TextStyle(color: Colors.black),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('10 EGP',style: TextStyle(color: Colors.orange),),
                                  SvgPicture.asset(
                                    height: 20,
                                    width: 20,
                                    'assets/plus.svg'
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      )
    );
  }
}
