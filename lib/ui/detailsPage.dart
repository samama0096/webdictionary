import 'package:dictionary/service/word_response.dart';
import 'package:dictionary/ui/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final WordResponse wordResponse;

  DetailScreen(this.wordResponse);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey[800]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.blueGrey[900],
            ),
            width: size.width * 0.4,
            height: size.height * 0.7,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "${wordResponse.word}",
                  style:
                      GoogleFonts.orbitron(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.3,
                    height: size.height * 0.4,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final meaning = wordResponse.meanings[index];
                        final definations = meaning.definitions;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.orangeAccent),
                              child: Center(
                                child: Text(
                                  meaning.partOfSpeech == null
                                      ? "N/A"
                                      : meaning.partOfSpeech,
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ListView.separated(
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Text(
                                    "Defination : ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    definations[index].definition == null
                                        ? "N/A"
                                        : definations[index].definition,
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Sentence  :",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                      definations[index].example == null
                                          ? "N/A"
                                          : definations[index].example,
                                      style: TextStyle(color: Colors.blueGrey))
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 40,
                              ),
                              itemCount: definations.length,
                              shrinkWrap: true,
                            )
                          ],
                        );
                      },
                      itemCount: wordResponse.meanings.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 32,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 125,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(16)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => homePage()),
                          (route) => false);
                    },
                    child: Text(
                      "Find Next ?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
