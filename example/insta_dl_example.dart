import 'package:insta_dl/insta_dl.dart';

void main() async {
  final insta = Insta();
  final res = await insta.get(
      "https://www.instagram.com/reel/CkdgpVFjgce/?utm_source=ig_web_copy_link");
  print(
      "meta:\n title: ${res.meta?.title}\n source: ${res.meta?.source}\ntimestamp: ${res.timestamp}\n");

  for (var a in res.url!) {
    print("url: ${a.url}");
  }
}
