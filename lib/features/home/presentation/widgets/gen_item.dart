import 'package:cimawy/config/routes/app_router.dart';
import 'package:cimawy/core/utils/app_images.dart';
import 'package:cimawy/core/utils/styles.dart';
import 'package:cimawy/features/home/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenItem extends StatelessWidget {
  Genres genre;
  Map<int, String> gens = {
    28: "action",
    12: "adv",
    16: "anim",
    35: "comedy",
    80: "crime",
    99: "doc",
    18: "drama",
    10751: "family",
    14: "fantasy",
    36: "history",
    27: "horror",
    10402: "music",
    9648: "mystery",
    10749: "romance",
    878: "science",
    10770: "tv",
    53: "thriller",
    10752: "war",
    37: "western"
  };

  GenItem({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.filtered,
            arguments: "${genre.id}");
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.asset(
              gens.containsKey(genre.id)
                  ? "${AppImages.ic_gen}ic_${gens[genre.id]}.png"
                  : AppImages.gen_general,
              height: 99.h,
              width: 158.w,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            genre.name ?? "",
            style: Styles.genTitleStyle,
          )
        ],
      ),
    );
  }
}
