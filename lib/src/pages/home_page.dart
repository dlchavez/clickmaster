import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Contador();
  }
}

class _Contador extends State<HomePage> {
  int contador = 0;

  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        //stream: obj_bloc.sale_Stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('App de conteo'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Número de clicks',
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    '$contador',
                    //'${snapshot.data}',
                    style: TextStyle(fontSize: 30),
                  ),
                  TextField(
                    controller: input,
                    decoration: const InputDecoration(
                      hintText:
                          'Clic en "+" para sumar o en menos para quitar "-"',
                      contentPadding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: _botones(),
          );
        });
  }

  Widget _botones() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: cero),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: disminuir),
        SizedBox(
          width: 8,
        ),
        FloatingActionButton(child: Icon(Icons.add), onPressed: aumentar)
      ],
    );
  }

  void aumentar() {
    setState(() => {
          contador++,
          input.text = contador.toString()
          //obj_bloc.ingresa_Stream.add(IncrementaContador())
        });
  }

  void disminuir() {
    setState(() => {
          contador--,
          input.text = contador.toString()
          //obj_bloc.ingresa_Stream.add(ReducirContador())
        });
  }

  void cero() {
    setState(() => {
          //obj_bloc.ingresa_Stream.add(EncerarContador())
          contador = 0,
          input.text = '0'
        });
  }
}
