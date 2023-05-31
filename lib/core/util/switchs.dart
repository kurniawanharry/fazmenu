import 'package:fazmenu/core/components/label_color.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

String orderTypeHistory(OrderType type) {
  switch (type) {
    case OrderType.ongoing:
      return 'Berlangsung';
    case OrderType.success:
      return 'Selesai';
    case OrderType.cancel:
      return 'Batal';
    default:
  }
  return '';
}

Widget orderStatus(int value) {
  String status = '';
  Color color;
  switch (value) {
    case 100:
      status = 'Batalkan Pesanan';
      color = FazColors.pink;
      break;
    case 200:
      status = 'Pesanan sedang diproses';
      color = FazColors.blue[600]!;
      break;
    default:
      status = 'UNDEFINED';
      color = FazColors.gray;
      break;
  }
  return LabelColor(
    text: status,
    color: color,
    withBorder: false,
  );
}

Widget orderType(int value) {
  String status = '';
  Color color;
  switch (value) {
    case 100:
      status = 'Makan Ditempat';
      color = FazColors.blue[600]!;
      break;
    case 200:
      status = 'Pesan Antar';
      color = FazColors.emerald[600]!;
      break;
    default:
      status = 'UNDEFINED';
      color = FazColors.gray;
      break;
  }
  return LabelColor(
    text: status,
    color: color,
  );
}

Widget progressIndicator(ProgressIndicatorType? progressIndicatorType,
    {Color color = FazColors.blue, double size = 20}) {
  switch (progressIndicatorType) {
    case ProgressIndicatorType.rotatingPlain:
      return SpinKitRotatingPlain(color: color, size: size);
    case ProgressIndicatorType.doubleBounce:
      return SpinKitDoubleBounce(color: color, size: size);
    case ProgressIndicatorType.wave:
      return SpinKitWave(color: color, size: size);
    case ProgressIndicatorType.wanderingCubes:
      return SpinKitWanderingCubes(color: color, size: size);
    case ProgressIndicatorType.fadingFour:
      return SpinKitFadingFour(color: color, size: size);
    case ProgressIndicatorType.fadingCube:
      return SpinKitFadingCube(color: color, size: size);
    case ProgressIndicatorType.pulse:
      return SpinKitPulse(color: color, size: size);
    case ProgressIndicatorType.chasingDots:
      return SpinKitChasingDots(color: color, size: size);
    case ProgressIndicatorType.threeBounce:
      return SpinKitThreeBounce(color: color, size: size);
    case ProgressIndicatorType.circle:
      return SpinKitCircle(color: color, size: size);
    case ProgressIndicatorType.cubeGrid:
      return SpinKitCubeGrid(color: color, size: size);
    case ProgressIndicatorType.fadingCircle:
      return SpinKitFadingCircle(color: color, size: size);
    case ProgressIndicatorType.rotatingCircle:
      return SpinKitRotatingCircle(color: color, size: size);
    case ProgressIndicatorType.foldingCube:
      return SpinKitFoldingCube(color: color, size: size);
    case ProgressIndicatorType.pumpingHeart:
      return SpinKitPumpingHeart(color: color, size: size);
    case ProgressIndicatorType.dualRing:
      return SpinKitDualRing(color: color, size: size);
    case ProgressIndicatorType.hourGlass:
      return SpinKitHourGlass(color: color, size: size);
    case ProgressIndicatorType.pouringHourGlass:
      return SpinKitPouringHourGlass(color: color, size: size);
    case ProgressIndicatorType.fadingGrid:
      return SpinKitFadingGrid(color: color, size: size);
    case ProgressIndicatorType.ring:
      return SpinKitRing(color: color, size: size);
    case ProgressIndicatorType.ripple:
      return SpinKitRipple(color: color, size: size);
    case ProgressIndicatorType.spinningCircle:
      return SpinKitSpinningCircle(color: color, size: size);
    case ProgressIndicatorType.squareCircle:
      return SpinKitSquareCircle(color: color, size: size);
    default:
      return SpinKitCircle(color: color, size: size);
  }
}

Widget dialogIcon(DialogIcon value) {
  switch (value) {
    case DialogIcon.ok:
      return SvgPicture.asset(
        'assets/icons/svg/success.svg',
        height: 80,
        color: FazColors.green[400],
      );
    case DialogIcon.cancel:
      return SvgPicture.asset(
        'assets/icons/svg/cancel.svg',
        height: 80,
        color: FazColors.pink[400],
      );
    case DialogIcon.question:
      return SvgPicture.asset(
        'assets/icons/svg/question_mark.svg',
        height: 80,
        color: FazColors.yellow[400],
      );
    default:
  }
  return const SizedBox();
}
