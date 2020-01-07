import 'package:intl/intl.dart';

import 'prog_day.dart';

class SrcChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();
    router.route("/").link(() => YearController());
    return router;
  }
}

class YearController extends ResourceController {
  @Operation.get()
  Future<Response> withYear(
      {@Bind.query('year') int year,
      @Bind.query('currentDate') String currentDate}) async {
    const progDay = Duration(days: 255);
    if (year != null && year >= 1000 && year <= 10000) {
      try {
        final date = DateTime(year).add(progDay);
        final formatter = DateFormat("dd/MM/yy");
        return Response.ok(
            {"errorCode": 200, "dataMessage": formatter.format(date)});
      } catch (e) {
        return Response.ok({"errorCode": 400, "dataMessage": "Bad request"});
      }
    } else if (currentDate != null) {
      try {
        final _currentDate =
            "${currentDate.substring(4)}${currentDate.substring(2, 4)}${currentDate.substring(0, 2)}";
        final date = DateTime.parse(_currentDate);
        final closestDate =
            (date.compareTo(DateTime(date.year).add(progDay)) < 0)
                ? DateTime(date.year).add(progDay)
                : DateTime(date.year + 1).add(progDay);
        print(closestDate);
        return Response.ok({
          "errorCode": 200,
          "dataMessage": "${closestDate.difference(date).inDays}"
        });
      } catch (e) {
        return Response.ok({"errorCode": 400, "dataMessage": "Bad request"});
      }
    } else {
      return Response.ok({"errorCode": 400, "dataMessage": "Bad request"});
    }
  }
}
