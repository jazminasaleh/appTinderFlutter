import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final _focusNode = FocusNode();

  List<bool> isActive = [
    true,
    true,
    true,
    true,
    true,
  ];
  int rating = 0;
  String text = '';
  @override
  Widget build(BuildContext context) {
    const outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Colors.grey),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 50),
            child: ListView(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xff5487a2),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Tu cita fue agendada\ncon éxito',
                  style: TextStyle(
                    color: Color(0xff5487a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const Text(
                  'Califica tu experiencia en la app',
                  style: TextStyle(
                    color: Color(0xff5487a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  focusNode: _focusNode,
                  onTapOutside: (event) => _focusNode.unfocus(),
                  decoration: const InputDecoration(
                    filled: false,
                    hintText: 'Comentario',
                    enabledBorder: outlineBorder,
                    focusedBorder: outlineBorder,
                  ),
                  maxLines: 5,
                  onChanged: (value) {
                    text = value;
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),
                const SizedBox(height: 10),
                const Text(
                  'Selecciona tu nivel de satisfacción',
                  style: TextStyle(
                    color: Color(0xff5487a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        rating = 1;
                        if (!isActive[0]) {
                          rating = 0;
                          isActive = bootRating(rating);
                        } else {
                          isActive = bootRating(rating);
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        (isActive[0]) ? Icons.star_border : Icons.star,
                        size: 35,
                        color: const Color(0xfffedd17),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        rating = 2;
                        if (!isActive[1]) {
                          rating = 1;
                          isActive = bootRating(rating);
                        } else {
                          isActive = bootRating(rating);
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        (isActive[1]) ? Icons.star_border : Icons.star,
                        size: 35,
                        color: const Color(0xfffedd17),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        rating = 3;
                        if (!isActive[2]) {
                          rating = 2;
                          isActive = bootRating(rating);
                        } else {
                          isActive = bootRating(rating);
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        (isActive[2]) ? Icons.star_border : Icons.star,
                        size: 35,
                        color: const Color(0xfffedd17),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        rating = 4;
                        if (!isActive[3]) {
                          rating = 3;
                          isActive = bootRating(rating);
                        } else {
                          isActive = bootRating(rating);
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        (isActive[3]) ? Icons.star_border : Icons.star,
                        size: 35,
                        color: const Color(0xfffedd17),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        rating = 5;
                        if (!isActive[4]) {
                          rating = 4;
                          isActive = bootRating(rating);
                        } else {
                          isActive = bootRating(rating);
                        }

                        setState(() {});
                      },
                      icon: Icon(
                        (isActive[4]) ? Icons.star_border : Icons.star,
                        size: 35,
                        color: const Color(0xfffedd17),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    /*
                      AQUI TOMAN LOS DATOS DE LA PANTALLA CON EN ON PRESSED DEL BOTON
                    */
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Datos'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Comentario: $text'),
                              const SizedBox(height: 10),
                              Text('Calificacion: $rating')
                            ],
                          ),
                        );
                      },
                    );
                    /*
                      HASTA AQUI TOMAN LOS DATOS DE LA PANTALLA CON EN ON PRESSED DEL BOTON
                    */
                  },
                  style: ButtonStyle(
                      minimumSize:
                      MaterialStateProperty.all<Size>(const Size(250, 70)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff5487a2),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                  child: const Text(
                    'Calificar experiencia',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<bool> bootRating(int num) {
    List<bool> list = [
      true,
      false,
      false,
      false,
      false,
    ];

    for (int i = 0; i < list.length; i++) {
      if (i < num) {
        list[i] = false;
      } else {
        list[i] = true;
      }
    }
    return list;
  }
}
