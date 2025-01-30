import 'dart:io';

import 'package:college_cupid/domain/models/personal_info.dart';
import 'package:college_cupid/domain/models/user_profile.dart';
import 'package:college_cupid/functions/snackbar.dart';
import 'package:college_cupid/presentation/widgets/global/custom_loader.dart';
import 'package:college_cupid/presentation/widgets/profile/interests/display_interests.dart';
import 'package:college_cupid/repositories/personal_info_repository.dart';
import 'package:college_cupid/repositories/user_profile_repository.dart';
import 'package:college_cupid/routing/app_router.dart';

import 'package:college_cupid/services/shared_prefs.dart';
import 'package:college_cupid/shared/colors.dart';
import 'package:college_cupid/shared/styles.dart';
import 'package:college_cupid/stores/user_controller.dart';
import 'package:college_cupid/stores/interest_store.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AboutYouScreen extends ConsumerStatefulWidget {
  final PersonalInfo myInfo;
  final String password;
  final String privateKey;
  final File? image;
  final UserProfile myProfile;

  const AboutYouScreen({
    super.key,
    required this.myProfile,
    required this.privateKey,
    required this.password,
    required this.image,
    required this.myInfo,
  });

  @override
  ConsumerState<AboutYouScreen> createState() => _AboutYouScreenState();
}

class _AboutYouScreenState extends ConsumerState<AboutYouScreen> {
  late TextEditingController bioController;
  late InterestStore interestStore;
  bool loading = false;

  @override
  void initState() {
    bioController = TextEditingController();
    interestStore = context.read<InterestStore>();
    interestStore.setSelectedInterests([]);
    super.initState();
  }

  final _cupidFormKey = GlobalKey<FormState>();

  void onSubmitInterests(
    UserProfileRepository userProfileRepo,
    PersonalInfoRepository personalInfoRepo,
    UserController commonStore,
  ) async {
    if (_cupidFormKey.currentState!.validate()) {
      if (interestStore.selectedInterests.length < 5) {
        showSnackBar("Select at least 5 interests!");
        return;
      }
      if (interestStore.selectedInterests.length > 20) {
        showSnackBar("You cannot select more than 20 interests!");
        return;
      }
      setState(() {
        loading = true;
      });
      widget.myProfile.bio = bioController.text.trim();
      widget.myProfile.interests =
          interestStore.selectedInterests.map((element) => element).toList();
      final goRouter = GoRouter.of(context);

      await personalInfoRepo.postPersonalInfo(widget.myInfo);

      // widget.myProfile.profilePicUrl =
      // await userProfileRepo.postUserProfile(widget.image, widget.myProfile);

      await SharedPrefs.setDHPublicKey(widget.myInfo.publicKey);
      await SharedPrefs.setDHPrivateKey(widget.privateKey);
      await SharedPrefs.setPassword(widget.password);
      await SharedPrefs.saveMyProfile(widget.myProfile.toJson());
      await commonStore.initializeProfile();
      setState(() {
        loading = false;
      });
      goRouter.goNamed(AppRoutes.splash.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProfileRepo = ref.read(userProfileRepoProvider);
    final personalInfoRepo = ref.read(personalInfoRepoProvider);

    final commonStoreController = ref.read(userProvider.notifier);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: CupidColors.titleColor,
          title: const Text("About you", style: CupidStyles.pageHeadingStyle),
          elevation: 0,
          forceMaterialTransparency: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: CupidColors.titleColor,
          onPressed: () {
            onSubmitInterests(userProfileRepo, personalInfoRepo, commonStoreController);
          },
          child: loading
              ? const CustomLoader(
                  color: Colors.white,
                )
              : const Icon(
                  FluentIcons.chevron_right_32_regular,
                  color: Colors.white,
                ),
        ),
        body: Form(
          key: _cupidFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: Text('Bio',
                          style: CupidStyles.headingStyle.copyWith(color: CupidColors.titleColor)),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text(
                        'Write a brief description about yourself to attract people to your profile.',
                        softWrap: true,
                        style: CupidStyles.lightTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: bioController,
                        maxLines: 5,
                        style: CupidStyles.normalTextStyle,
                        decoration: CupidStyles.textFieldInputDecoration.copyWith(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your bio";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Text(
                        "Your Interests",
                        style: CupidStyles.headingStyle.copyWith(color: CupidColors.titleColor),
                      ),
                    ),
                    const DisplayInterests(),
                    const SizedBox(height: 20),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
