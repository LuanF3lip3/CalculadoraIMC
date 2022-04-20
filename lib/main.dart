import 'package:flutter/material.dart';

void main() {
runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){},
          icon: const Icon(Icons.person_add))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            const Icon(Icons.person_outlined,
            size: 200,),
            const Text("Coloque suas informaçoes!!!",style: TextStyle(fontSize: 22,
            color: Colors.red),),
             const TextField(
               keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // label: Text('Peso (Kg)'),
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(color:Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // label: Text('Peso (Kg)'),
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(color:Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 24.0),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){},
                child: const Text('Calcular', style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Colors.black,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}