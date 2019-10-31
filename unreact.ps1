echo "
###########
# Unreact #
###########

This script will download and install the last stable version of Steam before the Library update on 10-30-19, and write a file to prevent the bootstrapper from attempting an update.

Before you start, close Steam. You can also (optionally) clear out *all* of the files in your Steam directory except for steamapps and userdata.

!! Please consider the implications of what you are doing and inspect this file. Running old versions of Steam may be fine for a while... until an exploit is discovered and Valve only updates the version with the new library. Be careful.
";
$Steamloc = Read-Host -Prompt "Please enter the location of your Steam installation; the process will begin when you hit ENTER";

echo "";

$IsWindows10 = [System.Environment]::OSVersion.Version.Major -eq 10;

# From SteamDB
$files = @(
	"tenfoot_misc_all.zip.1ca83d76835b4613170f5cead778b176b11f2b0c",
	"tenfoot_dicts_all.zip.33245b7d523f68418283e93b0572508fa127ee8f",
	"tenfoot_fonts_all.zip.12f7f1fa582860ea27358593f7082b3db603e444",
	"tenfoot_ambientsounds_all.zip.89b80bcfdd11b2b99257ddbbdc374e2df54e2738",
	"tenfoot_sounds_all.zip.3a8510744842725073c4f7cad1a82a872f09ff18",
	"tenfoot_images_all.zip.f44393217929454515a70c08d6e2f30c45493c47",
	"tenfoot_all.zip.6c0e23d5476376203ab20bef7632a824ffe8c722",
	"friendsui_all.zip.adf82354011e034c120d86282543b5b3f96a15ec",
	"resources_misc_all.zip.1d3b2d3671195d082d51d08924cc5ce87680a9be",
	"resources_music_all.zip.e2fb4ee342851d5dc753ebd6e51663309e7ff05f",
	"resources_hidpi_all.zip.bdba56fccb79cf9d11a0bb239be20a01c2b6e7cd",
	"resources_all.zip.c49ec9913ac8c38561a57a19b4bb13b15d92844c",
	"strings_en_all.zip.64109d45c64ba5377d5e84218cfd163cafd19851",
	"strings_all.zip.743b81270cd71b878bc52ad0a1824613ebb15c66",
	"public_all.zip.ba3fcf2d5bb8e5a7f76186ac07936adddfb3b19a",
	"bins_codecs_win32.zip.1ec234add481cd896911517bb8512a54f12269af",
	"bins_misc_win32.zip.cd82537c07e0d9862c038b434f0a45d0e9e2a4c3",
	"bins_win32.zip.913c4bd92bc9222e4119d9e9d5b15a3231cc04f5",
	"steam_win32.zip.2c3168e67424598dcf7898d33ce107840760f8af"
);

$files = New-Object System.Collections.ArrayList(,$files)

if( $IsWindows10 ){
	$files.Add("bins_cef_win32_win10-64.zip.6daf644756292d14c891642988a1f7933e86bf8f") > $null;
	$files.Add("bins_webhelpers_win32_win10-64.zip.189fc0a76d01f6346aec8483cb4375ddc8520124") > $null;
} else {
	$files.Add("bins_webhelpers_win32_win7-64.zip.189fc0a76d01f6346aec8483cb4375ddc8520124") > $null;
	$files.Add("bins_cef_win32_win7-64.zip.6daf644756292d14c891642988a1f7933e86bf8f") > $null;
}

foreach( $i in $files ){
	$out = New-Object System.Collections.ArrayList(,$i.Split("."));
	$out.RemoveAt($out.Count - 1);
	$out = $out -Join ".";

	echo "Preparing and extracting $out";

#	Invoke-WebRequest -Uri "https://steamcdn-a.akamaihd.net/client/$i" -OutFile $out;
#	Expand-Archive $out -Force -DestinationPath $Steamloc;
#	Remove-Item -Path $out;
}

[IO.File]::WriteAllLines("$Steamloc\steam.cfg", @("BootStrapperInhibitAll=enable", "BootStrapperForceSelfUpdate=disable"));

echo "Done...";
