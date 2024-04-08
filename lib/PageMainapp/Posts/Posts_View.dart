import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Layout/Style/Styleapp.dart';
import '../../Layout/Style/Themeapp.dart';
import '../../Layout/Widget/DialogStyles.dart';
import '../../Layout/Widget/ListViewBuilderStyles.dart';
import '../../Layout/Widget/SingleChildScrollStyles.dart';
import '../../Services/BackendIntegration/DummyAPI/HTTP_Request.dart';
import '../../Utilities/Components/Language/UserLanguages.dart';
import '../NewsDetail/Detail_Model.dart';
import '../NewsDetail/Detail_View.dart';
import '../PostDetail/DetailPost_Model.dart';
import '../PostDetail/DetailPost_View.dart';
import 'Posts_Controller.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final PostsController postsController = PostsController();

  List<Map<String, String>>? idPageText;

  Future<void> loadPageText() async {
    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.getIdPageText();
    setState(() {
      idPageText = pageTextMap['dashboardPageText'] ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    loadPageText();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        for (final teks in idPageText ?? []) {
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return RegularDialog(
                header: teks['HeaderWarning1'],
                description: teks['DescriptionWarning1'],
                declinedText: teks['DeclineButton1'],
                loadingDeclinedText: teks['LoadingDeclineButton1'],
                declinedOnTap: () async {
                  Navigator.of(context).pop();
                  return true;
                },
                acceptedText: teks['AcceptedButton1'],
                loadingAcceptedText: teks['LoadingAcceptedButton1'],
                acceptedOnTap: () async {
                  SystemNavigator.pop();
                  return true;
                },
              );
            },
          );
        }
      },
      child: SafeArea(
        child: FadeVerticalScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              PostsListViewBuilderRetrofit(
                futureSnapshot: getDataAllPosts,
                physics: const NeverScrollableScrollPhysics(),
                idPostData: postsController.idPostData,
                imagePathUserField: postsController.imagePathUserField,
                firstNameUserField: postsController.firstNameUserField,
                lastNameUserField: postsController.lastNameUserField,
                timeUserField: postsController.timeUserField,

                imagePathField: postsController.imagePathField,
                titleField: postsController.titleField,
                descField: postsController.descField,
                containerColor: themeColors.containerColorGrey,
                borderRadiusCircular: 10,
                onTap: (data, index) async {
                  DetailPostModel detailPostModel = DetailPostModel();
                  detailPostModel.postDetail = data;

                  if (detailPostModel.postDetail != null) {
                    List<Map<String, String>> idPageText;
                    Map<String, List<Map<String, String>>> pageTextMap = await LanguageSelected.detailPostSelected('dpm', detailPostModel).getIdPageTextAwait();
                    idPageText = pageTextMap['postDetailPageText'] ?? [];
                    Get.to(() => DetailPost(idPageText: idPageText));
                  } else {
                    return;
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
