import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/paginas/perfil.dart';
class Actualizardatos extends StatelessWidget {
  const Actualizardatos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 170,
                      height: 170,
          
                    ),
                    Container(
                      width: 150,
                      height: 150,
          
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image:DecorationImage(
                              fit: BoxFit.cover,
                              image:NetworkImage('assets/images/perfil-mujer-vivo.png')
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.red.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 8,
          
                            )
                          ]
                      ),
                    ),
                    Positioned(
                      bottom: 0,right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child:Icon(Icons.edit,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Text('usuario', style: TextStyle(color: Colors.grey),),
                    Spacer(
          
                    ),
                    Text(
                      'monica R', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Text('email', style: TextStyle(color: Colors.grey),),
                    Spacer(
          
                    ),
                    Text('alilondo@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Text('celular', style: TextStyle(color: Colors.grey),),
                    Spacer(
          
                    ),
                    Text('+57 3005964565',
                      style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Text(
                      'Fecha de Nacimiento', style: TextStyle(color: Colors.grey),),
                    Spacer(
          
                    ),
                    Text('16.06.1955',
                      style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ],
            ),
          ),
        ),),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.home_outlined), onPressed: () { Get.to(Perfil());},),label:'',),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label:''),
        ],

      ),);
  }

}