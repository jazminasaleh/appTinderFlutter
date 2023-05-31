import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/pages/actualizardatos.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';
import 'citas.dart';
import 'package:swipable_stack/swipable_stack.dart';
//*poder ver todas  las personas con las que puedo tener una cita
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
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(
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
          _Card(
            usuariosSerivices: usuariosSerivices,
          ),
          const Positioned(
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

class _Card extends StatefulWidget {
  UsuariosSerivices usuariosSerivices;
  _Card({required this.usuariosSerivices});
  @override
  State<_Card> createState() =>
      _CardState(usuariosSerivices: usuariosSerivices);
}

class _CardState extends State<_Card> {
  UsuariosSerivices usuariosSerivices;
  _CardState({required this.usuariosSerivices});
  final controller = SwipableStackController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Stack(children: [
        SwipableStack(
          onSwipeCompleted: (index, direction) {
            if (index >= usuariosSerivices.usuarios.length - 1) {
              setState(() {
                usuariosSerivices.usuarios.addAll(usuariosSerivices.usuarios);
              });
            }
          },
          allowVerticalSwipe: false,
          itemCount: usuariosSerivices.usuarios.length,
          controller: controller,
          builder: (BuildContext context, propierties) {
            return GestureDetector(
              onTap: () {
                
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(
                          '${usuariosSerivices.usuarios[propierties.index]['foto']}'),
                      fit: BoxFit.cover,
                      opacity: 0.7),
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
                      style: const TextStyle(
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
                      child: Text(
                        '${usuariosSerivices.usuarios[propierties.index]['signo']}',
                        style: const TextStyle(
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
                        Get.to(Citas(
                          nombre:
                              '${usuariosSerivices.usuarios[propierties.index]['nombre']}',
                        ));
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
              ),
            );
          },
        ),
      ]),
    );
  }
}
