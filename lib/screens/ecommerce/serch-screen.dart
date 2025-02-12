import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
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
                        SizedBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width/2,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white
                            ),
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
        
                              //labelText: 'Search'
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
        
            ),
            SizedBox(height: 20,),
            ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Burger'),
                  );
                })
          ],
        ),
      )
    );
  }
}
