import 'package:flutter/material.dart';

class Combustivel extends StatefulWidget {
  const Combustivel({super.key});

  @override
  State<Combustivel> createState() => _CombustivelState();
}

class _CombustivelState extends State<Combustivel> {
  //Controller Alcool / Gasolina:

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = '';

//Calcular:
  void _calcular() {
    //Atualmente colocar double? precoAlcool para possivei valores nulos
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            'Número Inválido. Digite números maiores que 0 e utiilize (.)';
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Abasteça com Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = 'Abasteça com Alcool';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alcool ou Gasolina?'),
        backgroundColor: Color.fromARGB(255, 1, 48, 87),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),

              // Texto Incial:

              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Saiba qual a melhor opção para abastecer seu carro',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //Alcool
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Preço Alcool, ex: 1.59'),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
              ),

              //Gasolina
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Preço Gasolina, ex: 5.59'),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
              ),

              //Button Calcular:
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 58, 104),
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: _calcular,
                  child: Text(
                    ' Calcular',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              //Resultado:

              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    _textoResultado,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
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
