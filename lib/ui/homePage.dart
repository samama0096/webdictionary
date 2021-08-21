import 'package:dictionary/service/word_repo.dart';
import 'package:dictionary/ui/listPage.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatelessWidget {
  @override
  TextEditingController txtcont = new TextEditingController();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[900],
        child: Center(
          child: Container(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dictionary Web App",
                        style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "This app is built in Flutter and fetches the word's info",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Text(
                        "from Google's API and shows the meanings and definations accordingly!",
                        style: TextStyle(color: Colors.blueGrey)),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white),
                      height: 40,
                      width: size.width * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Center(
                          child: TextFormField(
                            controller: txtcont,
                            decoration: InputDecoration(
                                hintText: "Search by word",
                                hintStyle: TextStyle(
                                    color: Colors.black38,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent[400],
                            borderRadius: BorderRadius.circular(12)),
                        height: 45,
                        width: size.width * 0.15,
                        child: Center(
                          child: ListTile(
                            onTap: () async {
                              final res =
                                  await WordRepository.getWordsFromDictionary(
                                      txtcont.text);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => listPage(
                                            words: res,
                                          )),
                                  (route) => false);
                            },
                            title: Text(
                              "Go to Meanings!",
                              style: TextStyle(color: Colors.blueGrey[900]),
                            ),
                            leading: Icon(
                              Icons.arrow_forward,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Text("All rights reserved by samama @(2021)",
                        style: TextStyle(color: Colors.blueGrey)),
                  ]),
            ),
            width: size.width * 0.5,
            height: size.height * 0.7,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey[800]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.blueGrey[900],
            ),
          ),
        ),
      ),
    );
  }
}
