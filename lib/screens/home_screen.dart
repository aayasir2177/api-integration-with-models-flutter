import 'package:api_with_models_flutter/models/album_model.dart';
import 'package:api_with_models_flutter/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text(
            "API Fetching With Model",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getAlbums(),
            builder: (context, AsyncSnapshot<List<AlbumModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      final album = snapshot.data![index];
                      return ListTile(
                        leading: const CircleAvatar(),
                        title: Text(
                          "${album.title}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      );
                    });
              }
            }));
  }
}
