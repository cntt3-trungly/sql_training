<!--

/*
Configure menu styles below
NOTE: To edit the link colors, go to the STYLE tags and edit the ssm2Items colors
*/
YOffset=80; // no quotes!!
XOffset=0;
staticYOffset=30; // no quotes!!
slideSpeed=20 // no quotes!!
waitTime=100; // no quotes!! this sets the time the menu stays out for after the mouse goes off it.
menuBGColor="white";
menuIsStatic="yes"; //this sets whether menu should stay static on the screen
menuWidth=80; // Must be a multiple of 10! no quotes!!
menuCols=2;
hdrFontFamily="verdana";
hdrFontSize="2";
hdrFontColor="white";
hdrBGColor="#000000";
hdrAlign="left";
hdrVAlign="center";
hdrHeight="5";
linkFontFamily="Verdana";
linkFontSize="2";
linkBGColor="white";
linkOverBGColor="white";
linkTarget="_top";
linkAlign="Left";
barBGColor="#444444";
barFontFamily="Verdana";
barFontSize="2";
barFontColor="Black";
barVAlign="center";
barWidth=20; // no quotes!!
barText="Chức Năng"; // <IMG> tag supported. Put exact html for an image to show.

///////////////////////////

// ssmItems[...]=[name, link, target, colspan, endrow?] - leave 'link' and 'target' blank to make a header

ssmItems[0]=["In", "javascript:void(window.print())"]
ssmItems[1]=["Trở Về Trước", "javascript:void(history.go(-1))"]
ssmItems[2]=["Thoát", "javascript:void(self.window.close())"]
buildMenu();

//-->
// Laser - http://mangvn.org - 09/02/2006
