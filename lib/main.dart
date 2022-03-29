import 'dart:math';

import 'package:flutter/material.dart';
import 'package:using_listview/itemdetails.dart';

import 'widget/items.dart';
import 'itemdetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:    const MyHomePage(),
    );
  }
}




class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {

 

 List items=[
   item(name:"apple" ,image:"https://media.istockphoto.com/photos/red-apple-with-leaf-isolated-on-white-background-picture-id185262648?b=1&k=20&m=185262648&s=170667a&w=0&h=2ouM2rkF5oBplBmZdqs3hSOdBzA4mcGNCoF2P0KUMTM=" , price:"1000"),
   item(name:"Orange",image:"https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Orange-Fruit-Pieces.jpg/1200px-Orange-Fruit-Pieces.jpg" ,price: "1500"),
   item(name:"Banana",image:"https://api.time.com/wp-content/uploads/2019/11/gettyimages-459761948.jpg?quality=85&crop=0px%2C74px%2C1024px%2C536px&resize=1200%2C628&strip" , price:"2000"),
   item(name:"Kiwi",image:"https://upload.wikimedia.org/wikipedia/commons/d/d3/Kiwi_aka.jpg" , price:"2000"),
   item(name:"Pomegranate",image:"https://media.istockphoto.com/photos/ripe-pomegranate-fruit-and-one-cut-in-half-with-leaf-picture-id940118920" , price:"3000"),
   item(name:"Watermelon",image:"https://images.heb.com/is/image/HEBGrocery/000688654?fit=constrain,1&wid=800&hei=800&fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0" , price:"500"),
   item(name:"Peach",image:"https://static.libertyprim.com/files/familles/peche-large.jpg?1574630286" ,price: "2500"),
   item(name:"Strawberry",image:"https://media.istockphoto.com/photos/red-berry-strawberry-isolated-picture-id1157946861?k=20&m=1157946861&s=612x612&w=0&h=TkcgPU1fblZISunSxNasdYUqUHz_Mrmo0eGWaxLQHEI=" , price:"3000"),
   ];

void addValue() {
      setState(() {
        items.add(item(name: namecn.text, image: imagecn.text, price: pricecn.text));
      });
  }

 final namecn =TextEditingController();
 final imagecn=TextEditingController()  ;
 final pricecn=TextEditingController();

  

  


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(child:
     Scaffold(

      appBar:  AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(child: Text("Fruits", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),)),

          leading:  IconButton(icon: const Icon(Icons.add), onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(builder: ((context) => add(context))));
          },),
        ),
      
      
      body:  ListView.builder(
        
          itemCount: items.length,
          itemBuilder: (context, index){
            
            return Dismissible(
              background: Container(color: Colors.red,),
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              onDismissed: (direction){
                setState(() {
                  items.removeAt(index);
                });
              },
              child: Card(
                      
                elevation: 3,
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  
                child: ListTile(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>details(name:items[index].name, image:items[index].image, price:items[index].price)),);
                  },
                  leading: Container(
                    height: 50,
                    width: 50,
                  
                    child: ClipOval(
                      child: Image.network(
                        items[index].image, fit: BoxFit.cover,),
                      ),
                  ),
                  title: Text(items[index].name, 
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                ),
                  
              ),
            );
            
          },
          
      
          ),    

     ),
    );
    

  }

  Widget add(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Center(
          child:Text("ADD item"),
        ),
      ),

      body: Column(children: [
        Center(
          child: Container(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(hintText: "Name"),
              controller: namecn,
            ),
          ),
        ),

        Center(
          child: Container(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(hintText: "image"),
              controller: imagecn,
              
            ),
          ),
        ),

        Center(
          child: Container(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(hintText: "price"),
              controller: pricecn,
            ),
          ),
        ),

        const SizedBox(height: 50,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(onPressed: addValue,
             child: const Text("add")),

             const SizedBox(width: 50,),
           
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("OK")),

          ],
        ),

        

      ],)
    );
  }
}
