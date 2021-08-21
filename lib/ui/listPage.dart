import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/web/audioplayers_web.dart';
import 'package:dictionary/service/word_response.dart';
import 'package:dictionary/ui/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class listPage extends StatefulWidget {
  final List<WordResponse> words;
  listPage({Key key, this.words}) : super(key: key);

  @override
  listPageState createState() => listPageState();
}

class listPageState extends State<listPage> {
  @override
  Widget build(BuildContext context) {
    List<WordResponse> words = widget.words;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              Text("Matching Results are here!",
                  style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 50,
              ),
              Container(
                height: size.height * 0.3,
                width: size.width * 0.4,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(words[index])));
                            },
                            tileColor: Colors.blueGrey,
                            hoverColor: Colors.white70,
                            title: Text(
                              words[index].word,
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blueGrey[900],
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.blueGrey,
                      );
                    },
                    itemCount: words.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
