import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/features/planets/widgets/background.dart';
import 'package:flutter_solar_system_application/features/space_images.dart/widgets/shimmer.dart';
import 'package:flutter_solar_system_application/theme/app_colors.dart';
import 'package:flutter_solar_system_application/theme/theme.dart';

class SpaceImagesDetails extends StatelessWidget {
  const SpaceImagesDetails({
    super.key,
    required this.image,
    required this.explanation,
    required this.date,
    required this.tag,
  });

  final String explanation;
  final String image;
  final String date;
  final int tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: tag,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          image,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: ShimmerWidget(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/geology-saturn.png');
                          },
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      explanation,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.articleExplenataion,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.articleDate,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
