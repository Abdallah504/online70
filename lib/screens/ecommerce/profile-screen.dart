import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: Image.network('https://s3-alpha-sig.figma.com/img/d10d/9dbc/ca9b240701475efe9467f6997c8c18de?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=DwUfg8AWUh8r578PG2Y0Cn6HpoBwxA9Jg9toDAECSMZ3Q1SCaGTRpr~XtUM-y953MaZ4fPZnXmiYNSC2aBOAxJTt4Nl~g~onWQqdXQP7tJxKoj1fU6yJfsRgPblsWYcwwbguL9GRuJid7~ZASq6RGBCgzzRokI595-gTqB-craxeRfgaw0LvvFEBh72pPUW5l3HDVW7JkySBxMzSkm0lZAzW597v751pF3G2aZbf6-W7Z7df7zkl24eLzWyjEXej4GuySVwX4sq7FHdj~kBfbh6c3Lvg9mWA1JIwTZtCbiAfDbLlDgMyUe6cmeDhDAnVXS15uJ~X3x3d8vD8P7U~KQ__',fit: BoxFit.fill,),
                ),
              ),
              SizedBox(height: 20,),
              Text('Name : Emily',style: TextStyle(color: Colors.black,fontSize: 20),),
              SizedBox(height: 10,),
              Text('Email : Emily@gmail.com',style: TextStyle(color: Colors.black,fontSize: 20),),
              SizedBox(height: 100,),

              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: Center(
                  child: Text('Logout',style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
