import 'package:flutter/material.dart';
import 'package:soccer_live/api_manager.dart';
import 'package:soccer_live/match_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> _onrefresh() {
    ApiManager.getAllMateches();
    return Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0XFFFAFAFA),
        elevation: 0.0,
        title: Text("Soccer Board", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _onrefresh,
        child: FutureBuilder(
          future: ApiManager.getAllMateches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final matches = snapshot.data!;

              if (matches.isEmpty) {
                return Center(child: Text("No matches found"));
              }

              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return MatchCard(match: matches[index]);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
