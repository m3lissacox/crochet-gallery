import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// First priority todo: refactor so the horizontally scrolling list code is reusable (ListView.builder?)

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Practice Project';
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Home(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: make a light theme
        backgroundColor: Colors.grey[900]!,
        appBar: AppBar(
          title: Text('Virtual Crochet Gallery'),
          backgroundColor: Colors.deepPurpleAccent[700],
        ),
          // body: new ListView.builder(
          //   itemCount: 12,
          //   itemBuilder: (context, index){
          //   return new HorizList();
          // }),
          
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                children: <Widget>[    
                  // Todo: make these container/Align sections a separate class
                  // need to figure out how to pass args to classes
                  Container(
                    margin: EdgeInsets.all(10.0),
                    alignment: Alignment(-1.0, -1.0), // top left corner
                    child: new Text(
                      'Mushrooms',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: HorizList(),
                  ),    

                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(top: 20.0),
                    alignment: Alignment(-1.0, -1.0), // top left corner
                    child: new Text(
                      'Veggies',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),   

                  Align(
                    alignment: Alignment.topLeft,
                    child: VeggieList(),
                  ),   

                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(top: 20.0),
                    alignment: Alignment(-1.0, -1.0), // top left corner
                    child: new Text(
                      'Book Cover',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),   

                  Align(
                    alignment: Alignment.topLeft,
                    child: BookCoverList(),
                  ),  

                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(top: 20.0),
                    alignment: Alignment(-1.0, -1.0), // top left corner
                    child: new Text(
                      'Wearables',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),   

                  Align(
                    alignment: Alignment.topLeft,
                    child: WearableList(),
                  ), 

                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(top: 20.0),
                    alignment: Alignment(-1.0, -1.0), // top left corner
                    child: new Text(
                      'Graduation Cap',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),   

                  Align(
                    alignment: Alignment.topLeft,
                    child: CapList(),
                  ),   
                  // add more crochet photo row galleries here

                ],
                ),
              ),
          ),
          drawer: Drawer(
            child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent[700],
                ),
                child:  new Text(
                      'Virtual Crochet Gallery',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
              ),
              ListTile(
                title: Text('Gallery'),
                onTap: () {
                  // Todo: add drop down to nav to each photo row
                  // close drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutRoute()),
                  );
                },
              ),
              ListTile(
                title: Text('Main Website'),
                onTap: _launchSite,
              ),
            ],
          ),
        ),
      );
  }
}
_launchSite() async {
  const url = 'https://m3lissacox.github.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class HorizList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> _mushroomPhotoURLs = <String>[
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzsu6-0ea7a4b0-bcdf-40c6-8e35-839e5b80dec6.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzsu6-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenN1Ni0wZWE3YTRiMC1iY2RmLTQwYzYtOGUzNS04MzllNWI4MGRlYzYuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.VhBfUrd8yliOU0niEOvfxX5QNpjUMPTF0A_iiBTbQPg',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzstk-118e2584-1c48-4818-a017-cd1d4e11a846.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzstk-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenN0ay0xMThlMjU4NC0xYzQ4LTQ4MTgtYTAxNy1jZDFkNGUxMWE4NDYuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.mjRK4gV-aYQlMs-ceALqmnz8rqf47iPSgseXY2h2Kls',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzst9-e6ccda5d-c9c2-4cf6-9448-b5df52c73bfa.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzst9-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenN0OS1lNmNjZGE1ZC1jOWMyLTRjZjYtOTQ0OC1iNWRmNTJjNzNiZmEuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ._7vxsJYXDhLSFXReKIqhlOpIhagrQgxAi4WYRnX9IZQ',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzsss-68717811-12dc-4334-8a2b-ed80aa4a99d2.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzsss-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenNzcy02ODcxNzgxMS0xMmRjLTQzMzQtOGEyYi1lZDgwYWE0YTk5ZDIuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.ZzOnfsAaJhBhPVp9LTP5kzRmCEz73iGK8CRcg4MWbEc',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzssf-7560212f-95cb-4dfe-b9bd-6a792ab9af36.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzssf-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenNzZi03NTYwMjEyZi05NWNiLTRkZmUtYjliZC02YTc5MmFiOWFmMzYuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.MONbpP78TMODqnPWVo5_gD1SLIAOYlgjGZQno7zhSao',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzsrn-d9d36aeb-4769-48db-8a22-5931392b0153.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzsrn-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenNybi1kOWQzNmFlYi00NzY5LTQ4ZGItOGEyMi01OTMxMzkyYjAxNTMuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.y-QVY5cbIEGlScFKHO4t8pG5sbRlXLOvuNf2RHCqb08',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzss4-084f59c9-7e12-4dba-8796-957f33bfc238.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzss4-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenNzNC0wODRmNTljOS03ZTEyLTRkYmEtODc5Ni05NTdmMzNiZmMyMzguanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.LmesiOPv80n8CElfTcA_G-R3515NYYOcm7BJiqcMfhc',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzsrg-0a0572eb-5429-43d8-aaff-e297ab4acebc.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzsrg-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenNyZy0wYTA1NzJlYi01NDI5LTQzZDgtYWFmZi1lMjk3YWI0YWNlYmMuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ._YzF2XMTEDOuhIwAc-kCZt9-jImyJU21tW3-rH3DbbY',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzstu-303e8277-f163-42ca-89f7-3c2bd06b3be3.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzstu-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenN0dS0zMDNlODI3Ny1mMTYzLTQyY2EtODlmNy0zYzJiZDA2YjNiZTMuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.BSM7WVWx-xnZswB1tpecgu39timaxuuBMKWKDRSBkSg',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/denj13d-4a17b05d-755d-4d4e-a395-5799d2183dbf.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_denj13d-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVuajEzZC00YTE3YjA1ZC03NTVkLTRkNGUtYTM5NS01Nzk5ZDIxODNkYmYuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.piPjtFOAASLERxcdxHzaEPnCmsL_QvHpMeBeN0Ibe3E', 
      ];
    return new Container(
      height: 250.0,

      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index)
      {
        return Image.network(
          _mushroomPhotoURLs[index],
          //width: 150,
          fit: BoxFit.contain
        );
      }, scrollDirection: Axis.horizontal,),
    );
  }
}

class VeggieList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> _veggiePhotoURLs = <String>[
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzsqu-b4483c3f-03f6-40dc-83ae-a0f0b05b5cc0.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzsqu-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenNxdS1iNDQ4M2MzZi0wM2Y2LTQwZGMtODNhZS1hMGYwYjA1YjVjYzAuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.oob2YiCYx5KlRSk0V3WubRQNM5b1YNzHM7tLEL0Yx68',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzsua-31ebce44-3141-419f-acef-1efb77878537.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzsua-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenN1YS0zMWViY2U0NC0zMTQxLTQxOWYtYWNlZi0xZWZiNzc4Nzg1MzcuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.4hFLs5y0pEjRqJvNObYw3bcekrfvt3CwtAqS6-z11eU',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzsun-f118baeb-5410-4dee-a709-16901e2461f5.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_delzsun-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVsenN1bi1mMTE4YmFlYi01NDEwLTRkZWUtYTcwOS0xNjkwMWUyNDYxZjUuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.brkb4WKSjJQuQvlRE0mUVaVZrfcuHutTJ7im_UzB20c',
      ];
    return new Container(
      height: 250.0,

      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index)
      {
        return Image.network(
          _veggiePhotoURLs[index],
          fit: BoxFit.contain
        );
      }, scrollDirection: Axis.horizontal,),
    );
  }
}

class BookCoverList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> _bookCoverPhotoURLs = <String>[
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/dem6133-73f97d69-7572-4f64-ace5-f1e6a5ed3455.jpg/v1/fill/w_794,h_1006,q_70,strp/untitled_by_pixellypie_dem6133-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTYyMSIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVtNjEzMy03M2Y5N2Q2OS03NTcyLTRmNjQtYWNlNS1mMWU2YTVlZDM0NTUuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.1iwH1wogX7c9_GZpUQ2_-2Qg3_Qt8UhJhfAdyx0oltg',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/dem612u-3ec8e0d7-d15e-4aee-8c2e-10220a4727a4.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_dem612u-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVtNjEydS0zZWM4ZTBkNy1kMTVlLTRhZWUtOGMyZS0xMDIyMGE0NzI3YTQuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.xcy72hjHjkSUHZVxFO2I8ZoD6CszVaYHoEMbpYXK-E0',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/dem613c-bbb850ac-8886-4994-9162-86d24e11708b.jpg/v1/fill/w_1032,h_774,q_70,strp/untitled_by_pixellypie_dem613c-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTYwIiwicGF0aCI6IlwvZlwvYTM3ZDkyNjEtMzgxNi00MDgzLTlmMzItMWFiYmM3YjhiOTYxXC9kZW02MTNjLWJiYjg1MGFjLTg4ODYtNDk5NC05MTYyLTg2ZDI0ZTExNzA4Yi5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.aETuOSDRe9t65b6cVYMIcaNFVMz1oAp0t3t1Z-QW4oY',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/dem612g-c6ec0285-c224-47fb-9a21-35c6e56456ba.jpg/v1/fill/w_1032,h_774,q_70,strp/untitled_by_pixellypie_dem612g-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTYwIiwicGF0aCI6IlwvZlwvYTM3ZDkyNjEtMzgxNi00MDgzLTlmMzItMWFiYmM3YjhiOTYxXC9kZW02MTJnLWM2ZWMwMjg1LWMyMjQtNDdmYi05YTIxLTM1YzZlNTY0NTZiYS5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.Tw2QZryX8AxXhggBQ3RMVAydCJE4opA1RX_5HLEO42E',
      ];
    return new Container(
      height: 250.0,

      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index)
      {
        return Image.network(
          _bookCoverPhotoURLs[index],
          fit: BoxFit.contain
        );
      }, scrollDirection: Axis.horizontal,),
    );
  }
}
class WearableList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> _wearablePhotoURLs = <String>[
       'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/dem61w8-26a14a90-2639-44f3-b506-4242836b85ab.jpg/v1/fill/w_774,h_1032,q_70,strp/untitled_by_pixellypie_dem61w8-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVtNjF3OC0yNmExNGE5MC0yNjM5LTQ0ZjMtYjUwNi00MjQyODM2Yjg1YWIuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.S09t3GEKT5AKyeccEJRBWQg5d95zZPFUVNWUEb02sg4',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzspw-d3ea101a-d0bb-4f74-9fc5-1394a27a4265.jpg/v1/fill/w_1032,h_774,q_70,strp/untitled_by_pixellypie_delzspw-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTYwIiwicGF0aCI6IlwvZlwvYTM3ZDkyNjEtMzgxNi00MDgzLTlmMzItMWFiYmM3YjhiOTYxXC9kZWx6c3B3LWQzZWExMDFhLWQwYmItNGY3NC05ZmM1LTEzOTRhMjdhNDI2NS5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.Oo2ehhUOn_DDpzApnBZt-a1ZFTX6tUgNotZv7YIk6jY',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzsqg-6bf953d3-4167-4fcc-bcc9-eec99c1d4b20.jpg/v1/fill/w_1032,h_774,q_70,strp/untitled_by_pixellypie_delzsqg-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTYwIiwicGF0aCI6IlwvZlwvYTM3ZDkyNjEtMzgxNi00MDgzLTlmMzItMWFiYmM3YjhiOTYxXC9kZWx6c3FnLTZiZjk1M2QzLTQxNjctNGZjYy1iY2M5LWVlYzk5YzFkNGIyMC5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.FMpkRmuTeV2i9OJgbe3MvWoZQvfTTXkcv3hYQJfXaiE',
      ];
    return new Container(
      height: 250.0,

      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: _wearablePhotoURLs.length,
        itemBuilder: (context, index)
      {
        return Image.network(
          _wearablePhotoURLs[index],
          fit: BoxFit.contain
        );
      }, scrollDirection: Axis.horizontal,),
    );
  }
}

class CapList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> _capPhotoURLs = <String>[
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/denmrfn-72594ba2-f1f8-41f0-ada3-9f50727b1da4.jpg/v1/fill/w_817,h_978,q_70,strp/4_by_pixellypie_denmrfn-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTUzMiIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVubXJmbi03MjU5NGJhMi1mMWY4LTQxZjAtYWRhMy05ZjUwNzI3YjFkYTQuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.5F_OXUdd3hL8RJWNKMls_OJX4tY1ppLl5y5F-psImqs',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/denmrfj-bce97255-f81a-4c9b-815f-2ead667b5510.jpg/v1/fill/w_812,h_984,q_70,strp/5_by_pixellypie_denmrfj-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTU1MSIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVubXJmai1iY2U5NzI1NS1mODFhLTRjOWItODE1Zi0yZWFkNjY3YjU1MTAuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.hNr19JYEJgqGyBt-YwEq_0MDUyyBl6r_M3dfltO9DMk',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/denmr82-8cbdb96f-2a78-4f12-a211-0f7226fb9812.jpg/v1/fill/w_774,h_1032,q_70,strp/3_by_pixellypie_denmr82-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTcwNyIsInBhdGgiOiJcL2ZcL2EzN2Q5MjYxLTM4MTYtNDA4My05ZjMyLTFhYmJjN2I4Yjk2MVwvZGVubXI4Mi04Y2JkYjk2Zi0yYTc4LTRmMTItYTIxMS0wZjcyMjZmYjk4MTIuanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.uLePwUehQdECa0sw_t5R3V01hRPNrxOhHvrkQOH-wRg',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/denmr8d-10fb8ecf-f611-4abb-a062-22837c6ffd07.jpg/v1/fill/w_1032,h_774,q_70,strp/2_by_pixellypie_denmr8d-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTYwIiwicGF0aCI6IlwvZlwvYTM3ZDkyNjEtMzgxNi00MDgzLTlmMzItMWFiYmM3YjhiOTYxXC9kZW5tcjhkLTEwZmI4ZWNmLWY2MTEtNGFiYi1hMDYyLTIyODM3YzZmZmQwNy5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.6VHBe39pIl_qc9cI-qqphRd6NF7gp3LuSiwSM0gjwrk',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/denmr87-8d2bddfe-b096-4d1a-854d-3ac15555a67e.jpg/v1/fill/w_1032,h_774,q_70,strp/1_by_pixellypie_denmr87-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTYwIiwicGF0aCI6IlwvZlwvYTM3ZDkyNjEtMzgxNi00MDgzLTlmMzItMWFiYmM3YjhiOTYxXC9kZW5tcjg3LThkMmJkZGZlLWIwOTYtNGQxYS04NTRkLTNhYzE1NTU1YTY3ZS5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.eIH-DA_6cTqoS78lMaUubk-BIQHp_L4hbVv_L66MTBY',
      ];
    return new Container(
      height: 250.0,

      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: _capPhotoURLs.length,
        itemBuilder: (context, index)
      {
        return Image.network(
          _capPhotoURLs[index],
          fit: BoxFit.contain
        );
      }, scrollDirection: Axis.horizontal,),
    );
  }
}

class AboutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
      body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                children: <Widget>[  
                     Container(
                    margin: EdgeInsets.all(10.0),
                     ),
                   CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a37d9261-3816-4083-9f32-1abbc7b8b961/delzspw-d3ea101a-d0bb-4f74-9fc5-1394a27a4265.jpg/v1/fill/w_1032,h_774,q_70,strp/untitled_by_pixellypie_delzspw-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTYwIiwicGF0aCI6IlwvZlwvYTM3ZDkyNjEtMzgxNi00MDgzLTlmMzItMWFiYmM3YjhiOTYxXC9kZWx6c3B3LWQzZWExMDFhLWQwYmItNGY3NC05ZmM1LTEzOTRhMjdhNDI2NS5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.Oo2ehhUOn_DDpzApnBZt-a1ZFTX6tUgNotZv7YIk6jY'),
                  ),  
                  Container(
                    margin: EdgeInsets.all(30.0),
                    alignment: Alignment(-1.0, -1.0), // top left corner
                    child: new Text(
                      'Welcome to the Virtual Crochet Gallery! (WIP) ' +
                      'This is a simple web app I created to learn Dart, familiarize ' + 
                      'myself with Flutter, and showcase some of my handmade crochet art.',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    alignment: Alignment(-1.0, -1.0), // top left corner
                    child: new Text(
                      'If you have any feedback or would like to learn more about me, ' +
                      'check out my main website m3lissacox.github.io! ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent[700], // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back to Gallery'),
                    )
                  ),
                ]
                ),
              ),
      ),
    );
  }
}