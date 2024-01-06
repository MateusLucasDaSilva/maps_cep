import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maps_cep/di/injectable.dart';
import 'package:maps_cep/presentation/pages/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = getIt<HomeController>();
  final TextEditingController _cepEditingController = TextEditingController();

  void _getLocation() {
    _controller.getLocation(int.parse(_cepEditingController.text));
  }

  void getCurrentPosition() {
    _controller.getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _cepEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Cep'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _cepEditingController,
                  decoration:
                      const InputDecoration(hintText: ' Ex:..99999-999'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset(
                      'assets/images/google_maps.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: _getLocation,
                    child: const Text('Buscar Localização')),
                TextButton(
                    onPressed: getCurrentPosition,
                    child: const Text('Buscar Localização Atual')),
                Text(_controller.location.toString()),
                Text(_controller.currentLocation.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
