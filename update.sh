#!/bin/bash
REPO=/mnt/d/github/sualfreds-repo
if [ "$1" != "" ]
then
    REPO="$1"
fi
if [ -f "$(pwd)/addons.xml" ]
then
    REPO="$(pwd)"
fi
if [ ! -d "$REPO" ]
then
    echo "Path does not exist"
    exit 0
fi
ZIP="$(command -v zip)"
if [ "$ZIP" = "" ]
then
    echo "zip missing. eg: apt-get install zip"
    exit 0
fi

cd "$REPO"
echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' >"$REPO"/addons.xml
echo '<addons>' >> "$REPO"/addons.xml
for name in `find . -maxdepth 1 -type d |grep -v \.git|grep -v addons|egrep -v "^\.$"|cut -d \/ -f 2 `; do
	VERSION=`cat $name/addon.xml|grep \<addon|grep $name |tr 'A-Z' 'a-z'|sed 's/.*version="\([^"]*\)"*.*/\1/g'`
    if [ ! -f "$name/$name-$VERSION.zip" ]; then
    	echo ""
    	echo "Creating $name-$VERSION.zip"
    	echo ""
    	zip -r $name/$name-$VERSION.zip $name -x \*.zip -x \*.git -x \*.psd >/dev/null 2>&1
    	find $name ! \( -name "addon.xml" -o -name "*.zip" -o -name "fanart.jpg" -o -name "icon.png" -o -name "screenshot*.*" \) -delete >/dev/null 2>&1
    else
    	echo "$name-$VERSION.zip already exists"
    fi
	cat $name/addon.xml|grep -v "<?xml " >> $REPO/addons.xml
	echo "" >> $REPO/addons.xml
done
echo "</addons>" >> $REPO/addons.xml
md5sum  $REPO/addons.xml > $REPO/addons.xml.md5