import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kt99/app/models/product/product.dart';
import 'package:kt99/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              ElevatedButton(
                  onPressed: () => controller.getProducts(),
                  child: const Text("UPDATE")),
              const SizedBox(height: 15),
              Center(
                child: controller.products.when(
                  loading: () => const CircularProgressIndicator(),
                  success: (List<Product> list) => ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: list.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var item = list[index];
                      return ListTile(
                        title: Text(item.title),
                        subtitle: Text(item.description),
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            item.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  failed: (message, error) => Text(
                    message,
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
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
