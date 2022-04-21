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

TextEditingController weightController = TextEditingController();
TextEditingController heightController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String _infoText = "Informe seus dados!!!";

void _resetFilds (){

  weightController.text = "";
  heightController.text = "";
  setState(() {
  _infoText = "Informe os dados!!!";
  });

  _formKey = GlobalKey<FormState>();
}

void _calculate(){

  double weight = double.parse(weightController.text);
  double height = double.parse(heightController.text) / 100;
  double imc = weight / (height * height);
setState(() {
if(imc < 18.6){
  _infoText = "Abaixo do peso ${imc.toStringAsPrecision(3)}";
}else if(imc >= 18.6 && imc < 24.8){
  _infoText = "Peso ideal ${imc.toStringAsPrecision(3)}";
}else if(imc >= 24.9 && imc < 29.8){
  _infoText = "Acima do peso ${imc.toStringAsPrecision(3)}";
}else if(imc >= 29.9 && imc < 34.8){
  _infoText = "Obesidade gral I ${imc.toStringAsPrecision(3)}";
}else if(imc >= 34.9 && imc < 40){
  _infoText = "Obesidade Gral II ${imc.toStringAsPrecision(3)}";
}else if(imc >= 40){
  _infoText = "Obesidade Gral III ${imc.toStringAsPrecision(3)}";
}   
});
weightController.clear();
heightController.clear();
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: ()=> _resetFilds(),
          icon: const Icon(Icons.person_add))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(Icons.person_outlined,
              size: 200,),
              Text(_infoText,
              style: const TextStyle(fontSize: 22,
              color: Colors.red),),
                TextFormField(
                 keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  // label: Text('Peso (Kg)'),
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(color:Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 24.0),
                  controller: weightController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Insira um peso!";
                    }
                    return null;
                  },
                ),
               TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  // label: Text('Peso (Kg)'),
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color:Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 24.0),
                  controller: heightController,
                   validator: (value) {
                    if(value!.isEmpty){
                      return "Insira uma altura!";
                    }
                    return null;
                  },
              ),
               Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _calculate();
                    }
                  },
                  child: const Text('Calcular', style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(primary: Colors.black,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}