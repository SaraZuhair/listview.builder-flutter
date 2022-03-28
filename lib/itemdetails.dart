import 'package:flutter/material.dart';
import 'main.dart';

class details extends StatelessWidget {
  String name,image,price;
   details({Key? key, required this.name,required this.image,required this.price}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(
       title: Center(child: Text(name)),
      ),

    body: Column(
      children: [
        Image.network(image),

        const SizedBox(height: 20,),

        Text("this is a $name", style: const TextStyle(fontSize: 30,
        fontWeight: FontWeight.bold,
        ),),
       
       const SizedBox(height: 10,),

       Text("price is \$$price"),

       const SizedBox(height: 20,),

       ElevatedButton(onPressed:(){
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MyHomePage()));
       } , 
       child: const Text("Go Back"))
        
      ],
    ),
      
    );
  }
}