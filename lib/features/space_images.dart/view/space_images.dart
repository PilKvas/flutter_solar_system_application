import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_solar_system_application/features/planets/widgets/widgets.dart';
import 'package:flutter_solar_system_application/features/space_images.dart/bloc/space_images_bloc.dart';
import 'package:flutter_solar_system_application/features/space_images.dart/view/space_images_details.dart';
import 'package:flutter_solar_system_application/features/space_images.dart/widgets/shimmer.dart';

class SpaceImagesList extends StatefulWidget {
  const SpaceImagesList({super.key});

  @override
  State<SpaceImagesList> createState() => _SpaceImagesListState();
}

class _SpaceImagesListState extends State<SpaceImagesList> {
  @override
  void initState() {
    context.read<SpaceImagesBloc>().add(SpaceImagesLoadData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<SpaceImagesBloc, SpaceImagesState>(
            builder: (context, state) {
              if (state is SpaceImagesLoading) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ShimmerWidget(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ShimmerWidget(
                                height: 10,
                                width: MediaQuery.of(context).size.width / 2,
                              ),
                              const ShimmerWidget(
                                height: 10,
                                width: 100,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: 3,
                );
              } else if (state is SpaceImagesLoaded) {
                return RefreshIndicator(
                  onRefresh: () async {
                    return context.read<SpaceImagesBloc>().add(SpaceImagesLoadData());
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      final image = state.spaceImages[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SpaceImagesDetails(
                                tag: index,
                                image: image.url,
                                explanation: image.explanation,
                                date: image.date,
                              );
                            },
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: index,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    image.url,
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
                                      return const Center(
                                        child: Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      );
                                    },
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      image.title,
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    image.date,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: state.spaceImages.length,
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
