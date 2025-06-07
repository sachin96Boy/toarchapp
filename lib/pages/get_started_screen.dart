import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/constants/app_constants.dart';
import 'package:tourch_app/providers/torch_provider.dart';
import 'package:tourch_app/utils/util_funcs.dart';

class GetStartedScreen extends ConsumerStatefulWidget {
  static const routeName = '/guide';
  const GetStartedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GetStartedScreenState();
}

class _GetStartedScreenState extends ConsumerState<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    final torch = ref.watch(torchProvider);

    return Scaffold(
      backgroundColor: handleBgColorByColorMode(torch.colorMode),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),

              Image.asset(
                AppConstants.appLogoWithSlogan,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),

              SizedBox(height: 12),
              Text(
                'FlashLightApp is a beautifully designed and responsive  app with dark-themed aesthetics and a glowing bulb UI. It’s crafted for a seamless and intuitive user experience.',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 24),

              Image.asset(AppConstants.guideImage1, width: 300, height: 300),
              SizedBox(height: 8),
              Text(
                AppConstants.guideText1,
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              Image.asset(AppConstants.guideImage3, width: 300, height: 300),
              SizedBox(height: 8),
              Text(
                AppConstants.guideText2,
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              Image.asset(AppConstants.guideImage2, width: 300, height: 300),
              SizedBox(height: 8),
              Text(
                AppConstants.guideText3,
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 24),
              Text(
                '✨ Features',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              FeatureItem(
                emoji: '🌕',
                title: 'Flashlight Toggle',
                description:
                    'Instantly turn your device\'s flashlight on or off with a single tap.',
              ),
              FeatureItem(
                emoji: '📳',
                title: 'Shake to Turn On/Off',
                description:
                    'Use your phone\'s motion sensors to control the flashlight hands-free.',
              ),
              FeatureItem(
                emoji: '🧭',
                title: 'Tabbed Interface',
                description:
                    'Navigate through different modes using an intuitive bottom tab system.',
              ),
              FeatureItem(
                emoji: '🆘',
                title: 'S.O.S Signal',
                description:
                    'Activate an emergency light signal pattern with one tap.',
              ),
              FeatureItem(
                emoji: '💡',
                title: 'Dim Light Mode',
                description:
                    'Gentle light suitable for reading or soft lighting.',
              ),
              FeatureItem(
                emoji: '🌇',
                title: 'Sunset Mode',
                description:
                    'Warm ambient glow that simulates a sunset effect.',
              ),
              FeatureItem(
                emoji: '🌙',
                title: 'Dark Theme & Glowing Bulb',
                description:
                    'A sleek, modern interface with a glowing bulb at the center.',
              ),
              FeatureItem(
                emoji: '⚙️',
                title: 'Settings & Extras',
                description:
                    'Customize your preferences from the top control section.',
              ),
              SizedBox(height: 24),
              Text(
                'Thank you for using Our App!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String emoji;
  final String title;
  final String description;

  const FeatureItem({
    super.key,
    required this.emoji,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
