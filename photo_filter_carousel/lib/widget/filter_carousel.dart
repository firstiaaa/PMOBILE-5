import 'package:flutter/material.dart';
import 'filter_selector.dart';
import 'filter_item.dart';

class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({Key? key}) : super(key: key);

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _buildPhotoWithFilter(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://docs.flutter.dev/cookbook/img-files/effects/instagram-buttons/millennial-dude.jpg',
              ),
              colorFilter: ColorFilter.mode(
                color.withOpacity(0.5),
                BlendMode.color,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      padding: const EdgeInsets.all(16.0),
      child: FilterSelector(
        onFilterChanged: _onFilterChanged,
        filters: _filters,
      ),
    );
  }
}