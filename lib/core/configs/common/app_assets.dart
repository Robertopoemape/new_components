enum JcImg {
  bgLogin('packages/jc_module/assets/img/bg-login.png'),
  //bgLogin('assets/img/bg-login.png'),
  noImg('packages/jc_module/assets/img/no-img.png');

  const JcImg(this.path);
  final String path;
}

enum JcImgSvg {
  baseLogo('packages/jc_module/assets/svg/base-logo.svg'),
  //baseLogo('assets/svg/base-logo.svg'),
  goEvent('packages/jc_module/assets/svg/go-event.svg'),
  //goEvent('assets/svg/go-event.svg'),
  logoPower('packages/jc_module/assets/svg/logo-power.svg'),
  //logoPower('assets/svg/logo-power.svg'),
  qrCamera('packages/jc_module/assets/svg/qr-camera.svg'),
  //qrCamera('assets/svg/qr-camera.svg'),
  titlePrimary('packages/jc_module/assets/svg/title-primary.svg'),
  //titlePrimary('assets/svg/title-primary.svg'),
  titleSecondary('packages/jc_module/assets/svg/title-secondary.svg'),
  //titleSecondary('assets/svg/title-secondary.svg'),
  userPass('packages/jc_module/assets/svg/user-pass.svg'),
  //userPass('assets/svg/user-pass.svg'),
  logoJoinnus('packages/jc_module/assets/svg/logo-joinnus.svg'),
  //logoJoinnus('assets/svg/logo-joinnus.svg'),
  rechargeReport('packages/jc_module/assets/svg/recharge-report.svg'),
  //rechargeReport('assets/svg/recharge-report.svg'),
  rechargeSeller('packages/jc_module/assets/svg/recharge-seller.svg'),
  //rechargeSeller('assets/svg/recharge-seller.svg'),

  fiberRecord('packages/jc_module/assets/svg/fiber-record.svg'),
  transferPoints('packages/jc_module/assets/svg/transfer-points.svg');

  const JcImgSvg(this.path);
  final String path;
}
