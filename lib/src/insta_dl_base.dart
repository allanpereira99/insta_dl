// SPDX-License-Identifier: MIT
// Copyright (c) 2022 Allan Pereira <https://github.com/allanpereira99>

import 'dart:convert';

import 'package:insta_dl/src/result_parse.dart';

import 'repositories/http_interface.dart';

class Insta {
  final IHttpService _service = HttpService();
  Future<ResultParse> get(String urlMedia) async {
    final Uri baseUrl = Uri.parse("https://instasupersave.com/");

    final response = await _service.get(baseUrl);
    final cookie = response.headers["set-cookie"];
    // get cookie from request
    final session = cookie[0]
        .split(";")[0]
        .replaceAll("XSRF-TOKEN=", "")
        .replaceAll("%3D", "");
    //REQUEST CONFIG
    final config = {
      "url": "${baseUrl}api/convert",
      "headers": {
        "origin": 'https://instasupersave.com',
        "referer": 'https://instasupersave.com/pt/',
        "sec-fetch-des": 'empty',
        "sec-fetch-mode": 'cors',
        "sec-fetch-site": 'same-origin',
        "user-agent":
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.52',
        "x-xsrf-token": "$session",
        "Content-Type": 'application/json',
        "Cookie": "XSRF-TOKEN=$session; instasupersave_session=$session"
      },
      "data": jsonEncode({"url": urlMedia})
    };
    final res = await _service.post(params: config);
    return ResultParse.fromJson(jsonDecode(res.body));
  }
}
