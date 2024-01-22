import 'package:flutter/material.dart';
import 'package:favourite_places/Provider/list_provider.dart';
import '../Models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesDetails extends ConsumerStatefulWidget {
  const PlacesDetails({super.key, required this.place});

  final Place place;

  @override
  ConsumerState<PlacesDetails> createState() => _PlacesDetailsState();
}

class _PlacesDetailsState extends ConsumerState<PlacesDetails> {
  void removePlace(Place place) {
    final String placeId = place.id;
    ref.watch(userPlacesProvider.notifier).removePlace(placeId);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.title),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Delete Place'),
                  content:
                      const Text('Are you sure you want to delete place ?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          removePlace(widget.place);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes'))
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.file(
            widget.place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
