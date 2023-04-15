import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StackedCardCarousel(
        spaceBetweenItems: 180,
        items: [BusinessCard(), BusinessCard(), BusinessCard(), BusinessCard()],
    ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: AppColors.color232323,
      height: 178,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Фотограф Екатерина',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.place, color: Colors.white),
              Text(
                '25th Legal Street, London',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          _buildRowSections(),
        ],
      ),
    );
  }

  Widget _buildRowSections() {
    return Container(
      child: Row(
        children: [
          _buildSmallSection(),
          _buildSmallSection(),
          _buildSmallSection(),
        ],
      ),
    );
  }

  Widget _buildSmallSection() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            '2+',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'лет опыта',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
