#!/bin/bash
if [ "$#" -ne 3 ] || ! [ -f "$1" ]; then
  echo "Usage: $0 configfile appName generatedPackageName" >&2
  exit 1
fi

xfce4-terminal -T jhipstergen -x yo jhipster &
sleep 2
WID=`xdotool search --name "jhipstergen"`
xdotool windowactivate $WID
xdotool windowfocus $WID
#appnam
xdotool type $2
xdotool key "Return"
#package
xdotool type $3
xdotool key "Return"
#Java Selection
if grep "Java7" $1 > /dev/null
then
xdotool key Down
xdotool key "Return"
else
  xdotool key "Return"
fi
if grep "HTTP Session" $1 > /dev/null
then
xdotool key "Return"
fi
if grep "OAuth2" $1 > /dev/null
then
xdotool key Down
xdotool key "Return"
fi
if grep "Token-based" $1 > /dev/null
then
xdotool key Down
xdotool key Down
xdotool key "Return"
fi

if grep "^SQL" $1 > /dev/null
then
  xdotool key "Return"
  cat $1 |tr  "\n$" "_" > tmpstring
  if  grep "SQL_MySQL" tmpstring > /dev/null
  then
    xdotool key "Return"
  else
    xdotool key Down
    xdotool key "Return"
  fi
  if grep "^H2" $1 > /dev/null
    then
    xdotool key "Return"
  else
      xdotool key Down
      xdotool key "Return"
  fi
  if grep "Hibernate 2nd level cache" $1 > /dev/null
    then
      if grep "EHCache" $1 > /dev/null
        then
        xdotool key "Return"
      fi
      if grep "HazelCast" $1 > /dev/null
      then
        xdotool key Down
        xdotool key "Return"
      fi
    else
      xdotool key Up
      xdotool key "Return"
    fi
  rm tmpstring
fi
if grep "MongoDB" $1 > /dev/null
  then
  xdotool key Down
  xdotool key "Return"
fi
if grep "Cassandra" $1 > /dev/null
  then
  xdotool key Down
  xdotool key Down
  xdotool key "Return"
fi
if grep "clustered HTTP sessions" $1 > /dev/null
  then
  xdotool key Down
  xdotool key "Return"
else
  xdotool key "Return"
fi
if grep "WebSocket" $1 > /dev/null
  then
  xdotool key Down
  xdotool key "Return"
else
  xdotool key "Return"
fi
if grep "Maven" $1 > /dev/null
  then
  xdotool key "Return"
else
  xdotool key Down
  xdotool key "Return"
fi
if grep "grunt" $1 > /dev/null
  then
  xdotool key "Return"
else
  xdotool key Down
  xdotool key "Return"
fi
if grep "UseCompass" $1 > /dev/null
  then
  xdotool key Down
  xdotool key "Return"
else
  xdotool key "Return"
fi
