import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';

import '../../service/api_requests.dart';
import '../../service/card_requests.dart';
import '../../ui/card.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../profile/bloc/profile_bloc.dart';
import 'bloc/public_bloc.dart';

class PublicPage extends StatelessWidget {
  PublicPage({super.key});

  final cardService = Injector().get<CardService>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PublicBloc(cardService: cardService),
      child: Scaffold(
        backgroundColor: AppColors.colorF8FCFF,
        body: BlocConsumer<PublicBloc, PublicState>(
          listener: (context, state) {
          
          },
          builder: (context, state) {
              if (state is PublicLoadedState) {
            return _buildLoadedBody(state: state, context: context);
          } else if (state is PublicLoadingState) {
            return _builldLoadingBody();
          } else {
            return const SizedBox();
          }
          },
        ),
      ),
    );
  }
  Widget _builldLoadingBody() {
    return Center(
      child: CupertinoActivityIndicator(),
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
                              userId: state.cards[index].id.toString(),
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
            ),
          ],
        ),
      ),
    );
  }
}
