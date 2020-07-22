import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyAppGridViewDataFromApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Git Hub Job',
        home: Scaffold(
            appBar: AppBar(title: Text('Github Jobs')),
            body: GridLayoutWithAPI()));
  }
}

class GridLayoutWithAPI extends StatefulWidget {
  GridLayoutWithAPI({Key key}) : super(key: key);
  @override
  _GridLayoutWithAPIState createState() => _GridLayoutWithAPIState();
}

class _GridLayoutWithAPIState extends State<GridLayoutWithAPI> {
  Future<List<Job>> jobAPI;

  @override
  void initState() {
    super.initState();
    this.jobAPI = fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: jobAPI,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var jobs = snapshot.data;
            print("JOBS: ${jobs}");
            return GridViewList(jobs: jobs);
          } else if (snapshot.hasError) {
            print("ERROR: ${snapshot.error}");
            return Text("Error");
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class GridViewList extends StatelessWidget {
  List<Job> jobs;
  GridViewList({Key key, List<Job> jobs}) {
    this.jobs = jobs;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        padding: const EdgeInsets.all(8.0),
        children: List.generate(20, (index) {
          return GridViewItem(job: jobs[index]);
        }));
  }
}

class GridViewItem extends StatelessWidget {
  Job job;
  GridViewItem({Key key, Job job}) {
    this.job = job;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      job: this.job,
    );
  }
}

class Card extends StatelessWidget {
  Job job;
  Card({Key key, Job job}) {
    this.job = job;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Image.network(job.companyLogo),
    );
  }
}

Future<List<Job>> fetchJobs() async {
  const String END_POINT = "https://jobs.github.com/positions.json";
  var resp = await http.get(END_POINT);
  print("RESP: ${resp.body}");

  if (resp.statusCode == 200) {
    var result = new List();
    if (resp.body != null) {
      var data = json.decode(resp.body) as List;
      result = data.map((d) => Job.fromJson(d)).toList();
    }
    return result;
  } else {
    throw Exception("Server error");
  }
}

class Job {
  final String id;
  final String type;
  final String url;
  final String createdAt;
  final String company;
  final String companyUrl;
  final String location;
  final String title;
  final String companyLogo;

  Job(
      {this.id,
      this.type,
      this.url,
      this.createdAt,
      this.company,
      this.companyLogo,
      this.companyUrl,
      this.title,
      this.location});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
        id: json['id'],
        type: json['type'],
        url: json['url'],
        createdAt: json['created_at'],
        company: json['company'],
        companyLogo: json['company_logo'],
        companyUrl: json['company_url'],
        title: json['title'],
        location: json['location']);
  }
}
