import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(
    context: context, 
    builder: (context)=>AlertDialog(
      title: const Text("Lokasyonun"),
      content: const TextField(
        decoration: InputDecoration(hintText: "Adres aranıyor.."),
      ),
      actions: [
        //Çıkış Butonu
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Çıkış'),
          ),

        //Kaydet Butonu
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kaydet'),
          ),
      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("şimdi teslim et",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary),
            ),
          InkWell(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Text(
                  "Sanko Bulvarı",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}