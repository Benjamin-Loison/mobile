$homePath = "~";
$secretsPath = $homePath + "/secrets"

$mobileKeyPath = $($secretsPath + "/bitwarden-mobile-key.p12");
$distCertPath = $($secretsPath + "/iphone-distribution-cert.p12");

security create-keychain -p $env:KEYCHAIN_PASSWORD build.keychain
security default-keychain -s build.keychain
security unlock-keychain -p $env:KEYCHAIN_PASSWORD build.keychain
security import $mobileKeyPath -k build.keychain -P $env:MOBILE_KEY_PASSWORD
security import $distCertPath -k build.keychain -P $env:DIST_CERT_PASSWORD