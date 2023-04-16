import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/utils/app_colors.dart';

import '../../service/card_requests.dart';
import '../../ui/card.dart';
import '../../utils/app_routes.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cardService = Injector().get<CardService>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(cardService: cardService),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoadedState) {
            return _buildLoadedBody(state: state, context: context);
          } else if (state is HomeLoadingState) {
            return _builldLoadingBody();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _builldLoadingBody() {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Text(
                          'CARDIFY',
                          style: TextStyle(
                            fontFamily: 'Phosphate',
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff4285F4),
                          ),
                        ),
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
          ),
          Align(child: CupertinoActivityIndicator()),
        ],
      ),
    );
  }

  Widget _buildLoadedBody(
      {required HomeLoadedState state, required BuildContext context}) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                        'CARDIFY',
                        style: TextStyle(
                          fontFamily: 'Phosphate',
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff4285F4),
                        ),
                      ),
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
            // Container(
            //   height: 40,
            //   color: AppColors.color9B9B9B,
            // ),
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
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Вы ещё не создали визитку'),
                        CupertinoButton(
                          onPressed: () {
                            context.go(Routes.editor);
                          },
                          child: const Text('Создать!'),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
