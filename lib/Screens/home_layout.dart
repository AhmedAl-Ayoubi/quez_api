import 'package:flutter/material.dart';

import '../Network/API_Reques.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  APIRequest apiRequest = APIRequest();
  String? dataImage;
  String? dataArticle;
  String? dataAuther;
  bool isLoading = true;

  void getAPIData() async{
setState(() {
  isLoading = true;

});
apiRequest.fetchDataArticle().then((quote)  {

  if (quote.tags.first.isNotEmpty) {
   apiRequest.fetchDataImage(cat: quote.tags.first).then((image) {
     setState(() {
       dataImage = image.url;
       dataArticle = quote.content;
       dataAuther = quote.author;
      if(dataImage!.isEmpty && dataArticle!.isEmpty &&dataAuther!.isEmpty ){
        isLoading = true;
      }
      else
        {
          isLoading = false;

        }
     });
   });

  }
}) ;

  }

  @override
  void initState() {
    getAPIData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(dataArticle);
    return  Scaffold(
      body:(isLoading==true)? Center(child: CircularProgressIndicator()) : Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child:Image.network("$dataImage",fit: BoxFit.cover,),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text("$dataArticle",style: TextStyle(fontSize: 25,color: Colors.white,
                    fontWeight: FontWeight.bold
                ),)),
              ),
              SizedBox(height: 20,),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF85E3C9),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("${dataAuther}",style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.w600),))
            ],
          ),

          Positioned(right: 10,top: 10,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF85E3C9),
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: () {
                setState(() {
                  getAPIData();

                });

              }, icon: Icon(Icons.restart_alt,color: Colors.green,size: 42,)),
            ),
          )

        ],
      )



      
    );
  }
}

