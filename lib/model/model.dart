class YogaModel {
  static String IDName = "ID";
  static String YogaName = "YogaName";
  static String SecondsORNot = "SecondsORNot";
  static String SecondsORTime = "SecondsORTime";
  static String ImageName = "ImageName";
  static String YoagaTeableOne = "BeginnerYoga";
  static String YoagaTeableTwo = "IntermediateYoga";
  static String YoagaTeableThree = "AdvancedYoga";
  static String YoagaTeableSummary = "YogaSummary";
  static String YogaWorkoutName = "YogaWorkoutName";
  static String BackImage = "BackImage";
  static String TimeTaken = "TimeTaken";
  static String TotalNoOfWorkout = "TotalNoOfWorkout";

  static List<String> YogaTableOneColumns = [
    YogaModel.IDName,
    YogaModel.YogaName,
    YogaModel.ImageName,
    YogaModel.SecondsORNot,
  ];
}

class Yoga {
  final int? id;
  final bool seconds;
  final String yogaTitle;
  final String yogaImageUrl;
  final String SecondsORTime;


  Yoga({this.id,
    required this.seconds,
    required this.yogaTitle,
    required this.yogaImageUrl, required this.SecondsORTime});

  Yoga Copy({int? id, bool? seconds, String? yogaTitle, String? yogaImageUrl,String? SecondsORTime}) {
    return Yoga(
        id: id ?? this.id,
        seconds: seconds ?? this.seconds,
        SecondsORTime: SecondsORTime ?? this.SecondsORTime,
        yogaTitle: yogaTitle ?? this.yogaTitle,
        yogaImageUrl: yogaImageUrl ?? this.yogaImageUrl);
  }

  static Yoga fromJSON(Map<String, Object?> json) {
    return Yoga(
        id: json[YogaModel.IDName] as int?,
        seconds: json[YogaModel.SecondsORNot] == 1,
        yogaTitle: json[YogaModel.YogaName] as String,
        yogaImageUrl: json[YogaModel.ImageName] as String,
        SecondsORTime: json[YogaModel.SecondsORTime] as String,


    );
  }

  Map<String, Object?> toJSON() {
    return {
      YogaModel.IDName: id,
      YogaModel.SecondsORNot: seconds?1 : 0,
      YogaModel.YogaName: yogaTitle,
      YogaModel.ImageName: yogaImageUrl,
      YogaModel.SecondsORTime: SecondsORTime
    };
  }
}
class YogaSummary {
  final int? id;
  final String YogaWorkoutName;
  final String BackImage;
  final String yogaImageUrl;
  final String TimeTaken;
  final String TotalNoOfWorkout;

  YogaSummary({
    this.id,
    required this.YogaWorkoutName,
    required this.BackImage,
    required this.yogaImageUrl,
    required this.TimeTaken,
    required this.TotalNoOfWorkout,
  });

  YogaSummary Copy({
    int? id,
    String? YogaWorkoutName,
    String? BackImage,
    String? yogaImageUrl,
    String? TimeTaken,
    String? TotalNoOfWorkout,
  }) {
    return YogaSummary(
      id: id ?? this.id,
      YogaWorkoutName: YogaWorkoutName ?? this.YogaWorkoutName,
      BackImage: BackImage ?? this.BackImage,
      yogaImageUrl: yogaImageUrl ?? this.yogaImageUrl,
      TimeTaken: TimeTaken ?? this.TimeTaken,
      TotalNoOfWorkout: TotalNoOfWorkout ?? this.TotalNoOfWorkout,
    );
  }

  static YogaSummary fromJSON(Map<String, Object?> json) {
    return YogaSummary(
      id: json[YogaModel.IDName] as int?,
      YogaWorkoutName: json[YogaModel.YogaWorkoutName] as String? ?? '',
      BackImage: json[YogaModel.BackImage] as String? ?? '',
      yogaImageUrl: json[YogaModel.ImageName] as String? ?? '',
      TimeTaken: json[YogaModel.TimeTaken] as String? ?? '',
      TotalNoOfWorkout: json[YogaModel.TotalNoOfWorkout] as String? ?? '',
    );
  }

  Map<String, Object?> toJSON() {
    return {
      YogaModel.IDName: id,
      YogaModel.YogaWorkoutName: YogaWorkoutName,
      YogaModel.BackImage: BackImage,
      YogaModel.TimeTaken: TimeTaken,
      YogaModel.TotalNoOfWorkout: TotalNoOfWorkout,
    };
  }
}

