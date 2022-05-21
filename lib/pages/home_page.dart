import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller.dart';

class Home extends StatelessWidget{
  Home({Key?key}):super(key: key);
  final TextEditingController textEditingController=TextEditingController();
  String icon='';
  double temp=0;
  String description='';
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("WEATHER",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        leading: Lottie.asset('assets/weather2.json'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GetBuilder<Controller>(
              init: Controller(),
                builder: (controller){
                 if(icon.isEmpty)
                   {
                     return Lottie.asset('assets/weather1.json',width: 175,height: 200);
                   }
                 return Card(
                       shape: const RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(25))
                       ),
                       color: Colors.black,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           ListTile(
                             leading: Image.network('http://openweathermap.org/img/wn/$icon@2x.png',color: Colors.cyanAccent,
                             height: 500,),
                             subtitle: Text(description.toUpperCase(),
                               style: const TextStyle(
                                   fontSize: 28,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white
                               ),),
                             title: Text('$temp°',
                               style: const TextStyle(
                                   fontSize: 80,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white
                               ),
                             ),
                           )
                         ],
                       ),
                 );
                },
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter City Name',
                label: Text('Enter City Name'),
                prefixIconColor: Colors.red,
                prefix: Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: ()async{
                    await Get.find<Controller>().putCity(textEditingController.text);
                    icon= await Get.find<Controller>().getWeather()!.icon;
                    temp= await Get.find<Controller>().getWeather()!.temp;
                    description= await Get.find<Controller>().getWeather()!.description;
                  },
                  child: const Text('Submit', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                  ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}