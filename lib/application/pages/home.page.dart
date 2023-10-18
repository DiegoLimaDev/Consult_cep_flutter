import 'package:cep_consult/domain/via_cep.model.dart';
import 'package:cep_consult/repositories/via_cep.repo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cepController = TextEditingController();
  ViaCepRepo viaCepRepo = ViaCepRepo();
  bool loading = false;
  ViaCepModel viaCepModel = ViaCepModel();

  @override
  void initState() {
    super.initState();
  }

  getCep() async {
    setState(() {
      loading = true;
    });
    viaCepModel = await viaCepRepo.getCep(cepController.text);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Consultar CEP',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              TextField(
                controller: cepController,
                keyboardType: TextInputType.number,
                maxLength: 8,
              ),
              Container(
                child: loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viaCepModel.logradouro ?? '',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              viaCepModel.bairro ?? '',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              viaCepModel.localidade ?? '',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    getCep();
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
                                  child: const Text('Consultar',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white))),
                            ),
                          ],
                        ),
                      ),
              )
            ],
          ),
        ));
  }
}
