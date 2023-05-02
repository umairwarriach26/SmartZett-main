import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPage extends StatelessWidget {
  const ShimmerPage({super.key});
  final _shimmerGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 154, 42, 77),
      Color.fromARGB(255, 219, 74, 74),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(
          //Default value
          enabled: true, //Default value
          direction: ShimmerDirection.ltr, //Default Value
          gradient: _shimmerGradient,
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(
                  "",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                subtitle: SelectableText(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(
                  "",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                subtitle: SelectableText(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(
                  "",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                subtitle: SelectableText(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(
                  "",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                subtitle: SelectableText(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(
                  "",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                subtitle: SelectableText(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(
                  "",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                subtitle: SelectableText(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}

class CardListItem extends StatelessWidget {
  const CardListItem({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(height: 16),
          _buildText(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://flutter'
            '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    if (isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 250,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      );
    } else {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
          'eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
      );
    }
  }
}
