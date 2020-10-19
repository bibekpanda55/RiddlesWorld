import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:riddleworld/categories/Puzzle/puzzle1@smit4297/puzzle1homescreen.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class PuzzleList extends StatefulWidget {
  @override
  _StatePuzzleList createState() => _StatePuzzleList();
}

class _StatePuzzleList extends State<PuzzleList> {
  List<Widget> _listItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    _loadCards();
  }

  void _loadCards() {
    List<ActionCard> cardList = [
      ActionCard(
        name: 'PUZZLE MANIA',
        description: '''IMORT YOUR FAV PICTURE AND SOLVE IT\nby @smit4297''',
        number: '1',
        onPressed: () {
          onPlayAudio();
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => PuzzleHomePage(title: "PUZZLE GAME")));
        },
      ),
    ];

    for (int i = 0; i < cardList.length; i++) {
      _listItems.add(cardList[i]);
    }
  }

  void onPlayAudio() async {
    AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio('assets/audios/click.mp3'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'PUZZLE RIDDLES',
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: _listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _listItems[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String name;
  final String number;
  final String description;

  const ActionCard(
      {Key key,
      @required this.onPressed,
      this.icon,
      @required this.name,
      @required this.number,
      @required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 9, bottom: 6),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              border: Border.all(width: 2), color: Colors.transparent),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10,
                child: Text(
                  number,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
