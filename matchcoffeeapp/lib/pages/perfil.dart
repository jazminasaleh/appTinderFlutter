import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/pages/actualizardatos.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';
import 'citas.dart';
import 'package:swipable_stack/swipable_stack.dart';

class Perfil extends StatelessWidget {
  UsuariosSerivices usuariosSerivices;
  Perfil({required this.usuariosSerivices});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              CustomCard(
                usuariosSerivices: usuariosSerivices,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Get.to(Actualizardatos());
                },
              ),
              label: ''),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  UsuariosSerivices usuariosSerivices;
  CustomCard({required this.usuariosSerivices});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width * 0.90,
      // color: Colors.amber,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _Card(usuariosSerivices: usuariosSerivices,),
          Positioned(
            bottom: 0,
            child: Row(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}

List imagnes = [
  'https://images.unsplash.com/photo-1552642986-ccb41e7059e7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
  'https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1817367890.jpg',
  'https://www.shutterstock.com/image-photo/happy-positive-handsome-old-man-260nw-2136574865.jpg',
  'https://images.unsplash.com/photo-1600804889194-e6fbf08ddb39?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80'
];

class _Card extends StatefulWidget {
  UsuariosSerivices usuariosSerivices;
  _Card({required this.usuariosSerivices});
  @override
  State<_Card> createState() => _CardState(usuariosSerivices: usuariosSerivices);
}

class _CardState extends State<_Card> {
  UsuariosSerivices usuariosSerivices;
  _CardState({required this.usuariosSerivices});
  final controller = SwipableStackController();

  @override
  Widget build(
    BuildContext context,
  ) {
    print('uno ${usuariosSerivices.usuarios}');
    return Scaffold(
      body: Stack(children: [
        SwipableStack(
          allowVerticalSwipe: false,
          itemCount: 4,
          controller: controller,
          builder: (BuildContext context, propierties) {
            ///*controller.rewind();
            print('index ${propierties.index}');
            print(
                'usuario ${usuariosSerivices.usuarios[propierties.index]['nombre']}');
            return Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(imagnes[propierties.index]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    spreadRadius: 6,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${usuariosSerivices.usuarios[propierties.index]['nombre']}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 14,
                    ),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Tauro',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Citas());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              color: Color(0xff5588a2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
