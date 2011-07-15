#!/bin/bash
htmltemplate=`echo "<!DOCTYPE html>\\n<html>\\n\\t<head>\\n\\t\\t<title>{{title}}</title>\\n\\t\\t<script type="text/javascript" src="lib/jquery.min.js"></script>\\n\\t\\t<script type="text/javascript" src="lib/underscore.js"></script>\\n\\t\\t<script type="text/javascript" src="script.js"></script>\\n\\t\\t<link rel="stylesheet" type="text/css" href="style.css" />\\n\\t</head>\\n\\t<body>\\n\\t\\t<h1>{{title}}</h1>\\n\\t</body>\\n</html>"`;
project=`zenity --entry "Project Name"`
projectFolder=`echo $project|sed s/\\\\W/-/g|awk '{print tolower($0)}'`;
mkdir "$projectFolder";
cd "$projectFolder";
mkdir lib;
cd lib;
wget http://code.jquery.com/jquery.min.js
wget http://documentcloud.github.com/underscore/underscore.js
cd ..
echo $htmltemplate;
echo -e $htmltemplate|sed -e s/{{title}}/"$project"/g >index.html
cat index.html
touch style.css
touch script.js
