import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';

import '../../service/api_requests.dart';
import '../../service/card_requests.dart';
import '../../ui/card.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../profile/bloc/profile_bloc.dart';
import 'bloc/public_bloc.dart';

class PublicPage extends StatefulWidget {
  PublicPage({super.key});

  @override
  State<PublicPage> createState() => _PublicPageState();
}

class _PublicPageState extends State<PublicPage> {
  final cardService = Injector().get<CardService>();

  WifiInfoWrapper? _wifiObject;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    WifiInfoWrapper? wifiObject;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      wifiObject = await WifiInfoPlugin.wifiDetails;
    } on PlatformException {}
    if (!mounted) return;

    setState(() {
      _wifiObject = wifiObject;
    });
  }

  @override
  Widget build(BuildContext context) {
    String ipAddress =
        _wifiObject != null ? _wifiObject!.ipAddress.toString() : '';
    return BlocProvider(
      create: (context) => PublicBloc(cardService: cardService, wifiIp: ipAddress),
      child: Scaffold(
        backgroundColor: AppColors.colorF8FCFF,
        body: BlocConsumer<PublicBloc, PublicState>(
          listener: (context, state) {},
          builder: (context, state) {
            print('$state');
            if (state is PublicLoadedState) {
              return _buildLoadedBody(state: state, context: context);
            } else if (state is PublicLoadingState) {
              return _builldLoadingBody(context);
            } else {
              return _builldLoadingBody(context);
            }
          },
        ),
      ),
    );
  }

  Widget _builldLoadingBody(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Row(
            children: [
              Text('CARDIFY'),
              Spacer(),
              InkWell(
                onTap: () {
                  context.push(Routes.profile);
                },
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              )
            ],
          ),
          Align(child: CupertinoActivityIndicator()),
        ],
      ),
    );
  }

  Widget _buildLoadedBody(
      {required PublicLoadedState state, required BuildContext context}) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('CARDIFY'),
                Spacer(),
                InkWell(
                  onTap: () {
                    context.push(Routes.profile);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              color: AppColors.color9B9B9B,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: (state.cards.length != 0)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cards.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            CardWidget(
                              name: state.cards[index].id.toString(),
                              phone: state.cards[index].phone.toString(),
                              role: state.cards[index].role.toString(),
                              telegram:
                                  state.cards[index].telegramUrl.toString(),
                              vk: state.cards[index].ownSite,
                              cardId: state.cards[index].id.toString(),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                          ],
                        );
                      },
                    )
                  : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('В вашей сети визиток не найдено.'),
                          CupertinoButton(
                            onPressed: () {
                              //emit loading
                              context
                                  .read<PublicBloc>()
                                  .add(PublicLoadingEvent());
                            },
                            child: Icon(Icons.refresh),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
