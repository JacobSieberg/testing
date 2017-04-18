#! /bin/bash

SCRIPT_DIR="$(dirname "$0")"
source $SCRIPT_DIR/config.sh $1 $2 $3

legato-spm --install --module WP85XX --update-link
source ~/legato/packages/legato.sdk.latest/resources/configlegatoenv

### Create Package Script ###

NAME=$PACKAGE_NAME'_'$VERSION'_'LEGATO
NAME_DIR=$BUILD_DIR/$NAME

echo "Cleaning packaging directories."
rm -rf $NAME_DIR

echo "Creating pacakge directory structure."
mkdir -p $NAME_DIR

FILES=""
EXE=""

echo "Copying application files."
for ((i=0; i<${#BINARY_FILES[@]}; i+=2)); do
  FILES=$FILES$'\t'$'\t'"[x] "$(pwd)/${BINARY_FILES[i]}$'\t'/${BINARY_DIR}${BINARY_FILES[i+1]}$'\n'
  EXE=$EXE$'\t'$'\t'"("${BINARY_FILES[i+1]}")"$'\n'
done

echo "Copying config files."
for ((i=0; i<${#CONF_FILES[@]}; i+=2)); do
  FILES=$FILES$'\t'$'\t'"[w] "$(pwd)/${CONF_FILES[i]}$'\t'/${CONF_DIR}${CONF_FILES[i+1]}$'\n'
done

echo "Adding adef file."
source $SCRIPT_DIR/adefTemplate.sh
echo "$TEMPLATE" > $NAME_DIR/$NAME.adef

echo "Building package."
cd $NAME_DIR
rm -rf _build_app
mkapp $NAME.adef -o ..

echo "Done"