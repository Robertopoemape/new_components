enum JcImg {
  bgLogin('assets/img/background.png'),
  //bgLogin('assets/img/background.png'),
  noImg('assets/img/no-img.png');

  const JcImg(this.path);
  final String path;
}

enum JcImgSvg {
  baseLogo('packages/jc_module/assets/svg/logo.svg'),
  //baseLogo('assets/svg/logo.svg'),
  goEvent('packages/jc_module/assets/svg/go-event.svg'),
  //goEvent('assets/svg/go-event.svg'),
  qrCamera('packages/jc_module/assets/svg/qr-camera.svg'),
  //qrCamera('assets/svg/qr-camera.svg'),
  titlePrimary('packages/jc_module/assets/svg/title-primary.svg'),
  //titlePrimary('assets/svg/title-primary.svg'),
  titleSecondary('packages/jc_module/assets/svg/title-secondary.svg'),
  //titleSecondary('assets/svg/title-secondary.svg'),
  userPass('packages/jc_module/assets/svg/user-pass.svg'),
  //userPass('assets/svg/user-pass.svg'),
  logo('packages/jc_module/assets/svg/logo.svg'),
  //logo('assets/svg/logo.svg'),
  rechargeReport('packages/jc_module/assets/svg/recharge-report.svg'),
  //rechargeReport('assets/svg/recharge-report.svg'),
  rechargeSeller('packages/jc_module/assets/svg/recharge-seller.svg'),
  //rechargeSeller('assets/svg/recharge-seller.svg'),

  fiberRecord('packages/jc_module/assets/svg/fiber-record.svg'),
  transferPoints('packages/jc_module/assets/svg/transfer-points.svg');

  const JcImgSvg(this.path);
  final String path;
}
