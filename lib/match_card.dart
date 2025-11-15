import 'package:flutter/material.dart';
import 'package:soccer_live/soccer_model.dart';

class MatchCard extends StatelessWidget {
  final SoccerMatch match;
  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // League name + date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                match.fixture.status.long,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                match.fixture.date.substring(11, 16), // HH:MM
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),

          SizedBox(height: 12),

          // Teams row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Team
              Expanded(
                child: Column(
                  children: [
                    Image.network(match.home.logoUrl, height: 40),
                    SizedBox(height: 8),
                    Text(
                      match.home.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Score
              Column(
                children: [
                  Text(
                    "${match.goal.home ?? '-'} : ${match.goal.away ?? '-'}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "${match.fixture.status.elapsedTime ?? 0}'",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),

              // Right Team
              Expanded(
                child: Column(
                  children: [
                    Image.network(match.away.logoUrl, height: 40),
                    SizedBox(height: 8),
                    Text(
                      match.away.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
