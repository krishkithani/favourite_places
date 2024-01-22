import 'package:favourite_places/Widgets/place_details.dart';
import 'package:favourite_places/main.dart';
import 'package:flutter/material.dart';

import '../Models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.favouritePlaces});

  final List<Place> favouritePlaces;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favouritePlaces.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(favouritePlaces[index].image),
        ),
        title: Text(
          favouritePlaces[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlacesDetails(place: favouritePlaces[index]),
            ),
          );
        },
      ),
    );
  }
}
