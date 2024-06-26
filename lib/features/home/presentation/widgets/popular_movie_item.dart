import 'package:cached_network_image/cached_network_image.dart';
import 'package:cimawy/config/routes/app_router.dart';
import 'package:cimawy/core/utils/app_colors.dart';
import 'package:cimawy/core/utils/constants.dart';
import 'package:cimawy/core/utils/styles.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:cimawy/features/home/presentation/widgets/poster_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularMovieItem extends StatelessWidget {
  MovieDetailsModel movie;

  PopularMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 290.h,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutesName.details,
                  arguments: movie.id);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl:
                        "${Constants.IMAGE_BASE_URL}${movie.backdropPath}",
                    height: 217.h,
                    width: double.infinity.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                        child: SizedBox(
                            width: 32.0.w,
                            height: 32.0.h,
                            child: CircularProgressIndicator(
                              strokeWidth: 4.r,
                            ))),
                    errorWidget: (context, url, error) => Container(
                          color: Colors.grey,
                          child: const Icon(
                            Icons.image_not_supported_rounded,
                          ),
                        )),
                Icon(
                  Icons.play_circle_fill_rounded,
                  color: AppColors.whiteColor,
                  size: 64.r,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 21.r, bottom: 24.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PosterItem(movie: movie),
                SizedBox(
                  width: 14.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 195.w,
                        child: Text(
                          movie.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.movieNameStyle,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        movie.releaseDate ?? "",
                        style: Styles.movieDateStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
