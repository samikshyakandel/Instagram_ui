import 'package:flutter/material.dart';
import 'package:instagram_design/constant/colors.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
List storyList=[
   {
      "name": "Samikshya",
      "imageUrl": "images/img2.jpg",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "Ganga",
      "imageUrl": "images/img6.jpg",
      "isOnline": false,
      "hasStory": false,
    },
    {
      "name": "Jamuna",
      "imageUrl": "images/img4.jpg",
      "isOnline": true,
      "hasStory": false,
    },
    {
      "name": "Anish",
      "imageUrl": "images/img3.jpg",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "Samikshya",
      "imageUrl": "images/img2.jpg",
      "isOnline": false,
      "hasStory": false,
    },
    {
      "name": "Ganga",
      "imageUrl": "images/i21.jpg",
      "isOnline": false,
      "hasStory": true,
    }
];

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: TextButton(onPressed: (){},
         child: const Text("Instagram",style: TextStyle(color: tdBlack),
         ),
         ),
         actions: <Widget>[
          IconButton(onPressed: (){}, 
          icon: const Icon(Icons.favorite_border_outlined),),
          IconButton(onPressed: (){}, 
          icon: const Icon(Icons.messenger_outline),),
         ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
          child: ListView(
            children: [
              Column(
                children: [
                  _stories(),
                  _instaBody(),
                  

                ],
              )
            ],
          ),
        
      ),
      ),
      
    );
  }
}

_stories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding:  const EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration:  const BoxDecoration(
                      shape: BoxShape.circle, color: tdGrey),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 33,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 75,
                  child: Align(
                      child: Text(
                    'Your Story',
                    overflow: TextOverflow.ellipsis,
                  )),
                )
              ],
            ),
          ),
          Row(
              children: List.generate(storyList.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        storyList[index]['hasStory']
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: tdBlue, width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                storyList[index]['imageUrl']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                            : Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            storyList[index]['imageUrl']),
                                        fit: BoxFit.cover)),
                              ),
                        storyList[index]['isOnline']
                            ? Positioned(
                                top: 38,
                                left: 42,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: tdGreen,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:tdWhite, width: 3)),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 75,
                    child: Align(
                        child: Text(
                      storyList[index]['name'],
                      overflow: TextOverflow.ellipsis,
                    )),
                  )
                ],
              ),
            );
          }))
        ],
      ),
    );
  }

  _instaBody(){
    return Padding(padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 15.0),
    child: Column(
      children: [
        Column(
          children: [
            SizedBox(height:30,
            child: Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage('images/img6.jpg'),),
                 const SizedBox(width: 10.0,),
                 const Text("samikshya_kandel",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 86,),
                PopupMenuButton(
                itemBuilder: (BuildContext context) {
                 return [
                   const PopupMenuItem(
                  child: Text('Unfollow'),
                    value: 'Unfollow',
                  ),
                  const PopupMenuItem(
                child: Text('Save'),
                value: 'Save',
               ),
            
          ];
        },
                ),
               
              ],
            ),
            ),
             const SizedBox(height: 10.0,),
            Container(
              height: 250.0,
              width: double.infinity,
              child: Image.asset('images/img6.jpg',fit: BoxFit.cover,),
            ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.message),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.share ),),
                    const SizedBox(width: 112,),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.save),),
                  ],
                ),
                const Row(
                  children: [
                    Text("Liked by",style: TextStyle(color: tdBlack),),
                    SizedBox(width: 5,),
                    Text("ganga_kandel",style: TextStyle(color: tdBlack,fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Text("and",style: TextStyle(color: tdBlack),),
                    SizedBox(width: 5,),
                    Text("others",style: TextStyle(color: tdBlack,fontWeight: FontWeight.bold),),
                  ],
                ),
              const Row(children: [
                Text("You are born to do this❤️"),
              ],),
              
        
                  
        
          ],
        ),
        const SizedBox(height: 15.0,), 
         Column(
          children: [
            SizedBox(height:30,
            child: Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage('images/img6.jpg'),),
                 const SizedBox(width: 10.0,),
                 const Text("samikshya_kandel",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 86,),
                PopupMenuButton(
                itemBuilder: (BuildContext context) {
                 return [
                   const PopupMenuItem(
                  child: Text('Unfollow'),
                    value: 'Unfollow',
                  ),
                  const PopupMenuItem(
                child: Text('Save'),
                value: 'Save',
               ),
            
          ];
        },
                ),
               
              ],
            ),
            ),
             const SizedBox(height: 10.0,),
            Container(
              height: 250.0,
              width: double.infinity,
              child: Image.asset('images/img6.jpg',fit: BoxFit.cover,),
            ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.message),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.share ),),
                    const SizedBox(width: 112,),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.save),),
                  ],
                ),
                const Row(
                  children: [
                    Text("Liked by",style: TextStyle(color: tdBlack),),
                    SizedBox(width: 5,),
                    Text("ganga_kandel",style: TextStyle(color: tdBlack,fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Text("and",style: TextStyle(color: tdBlack),),
                    SizedBox(width: 5,),
                    Text("others",style: TextStyle(color: tdBlack,fontWeight: FontWeight.bold),),
                  ],
                ),
              const Row(children: [
                Text("You are born to do this❤️"),
              ],),
              
        
                  
        
          ],
        ),
      ],
    ),
    );
  }