import 'package:flutter/material.dart';

import '../../../../Layout/Style/Styleapp.dart';
import '../../../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../../../Layout/Widget/TextStyles.dart';
import '../../Layout/Style/Themeapp.dart';

class DetailPost extends StatefulWidget {
  final List<Map<String, String>> idPageText;

  const DetailPost({
    Key? key,
    required this.idPageText
  }) : super(key: key);

  @override
  State<DetailPost> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  late List<Map<String, String>> idPageText;

  @override
  void initState() {
    super.initState();
    idPageText = widget.idPageText;
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Scaffold(
      body: PopScope(
        canPop: true,
        child: SafeArea(
          child: AnimateFadeVerticalScrollView(
            yStart: -30.0,
            yEnd: 0.0,
            child: Column(
              children: [
                for (final teks in idPageText ?? [])
                  Column(
                    children: [
                      const SizedBox(height: 10,),
                      SimpleAppBar(
                        leftText: teks['BackButton'],
                        leftIcon: const Icon(Icons.arrow_back_ios_new_sharp),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: teks['ImageUser'] != null ? Image
                                .network(
                              teks['ImageUser'],
                              width: 36,
                              height: 36,
                              fit: BoxFit.fill,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(
                                    'assets/Icon/logo.png',
                                    width: 36,
                                    height: 36,
                                    fit: BoxFit.fill,
                                  ) as Widget,
                                );
                              },
                            ) : Container(),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  teks['TitleNews'],
                                  style: StyleApp.largeTextStyle.copyWith(
                                    color: themeColors.textColorRegular,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  teks['DateUser'],
                                  style: StyleApp.mediumTextStyle.copyWith(
                                    color: themeColors.textColorRegular,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 14,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          teks['AuthorNews'],
                          style: StyleApp.largeTextStyle.copyWith(
                            color: themeColors.textColorRegular,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          teks['DateNews'],
                          style: StyleApp.mediumTextStyle.copyWith(
                            color: themeColors.textColorRegular,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: teks['ImagePath'] != null ? Image.network(
                          teks['ImagePath'],
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Image.asset(
                              'assets/Icon/logo.png',
                            ) as Widget;
                          },
                        ) : Container(),
                      ),
                      const SizedBox(height: 30,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(teks['DescriptionNews'],
                          style: StyleApp.extraLargeTextStyle.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                              color: themeColors.textColorRegular
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.favorite),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(teks['ContentNews'],
                              textAlign: TextAlign.justify,
                              style: StyleApp.largeTextStyle.copyWith(
                                color: themeColors.textColorRegular,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
