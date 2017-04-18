#! /bin/bash

SCRIPT_DIR="$(dirname "$0")"
source $SCRIPT_DIR/config.sh $1 $2

### Create Package Script ###

NAME=$PACKAGE_NAME'_'$VERSION'_'$ARCH
NAME_DIR=$BUILD_DIR/$NAME

echo "Cleaning packaging directories."
rm -rf $NAME_DIR

echo "Creating pacakge directory structure."
mkdir -p $NAME_DIR/DEBIAN
mkdir -p $NAME_DIR/$BINARY_DIR
mkdir -p $NAME_DIR/$CONF_DIR
mkdir -p $NAME_DIR/$SERIVICE_DIR

echo "Copying application files."
for ((i=0; i<${#BINARY_FILES[@]}; i+=2)); do
  cp ${BINARY_FILES[i]} $NAME_DIR/$BINARY_DIR/${BINARY_FILES[i+1]}
done

echo "Copying config files."
for ((i=0; i<${#CONF_FILES[@]}; i+=2)); do
  cp ${CONF_FILES[i]} $NAME_DIR/$CONF_DIR/${CONF_FILES[i+1]}
  echo $CONF_DIR/${CONF_FILES[i+1]} >> $NAME_DIR/DEBIAN/conffiles
done

echo "Copying service files."
for ((i=0; i<${#SERVICE_FILES[@]}; i+=2)); do
  cp ${SERVICE_FILES[i]} $NAME_DIR/$SERVICE_DIR/${SERVICE_FILES[i+1]}
done

echo "Adding control file."
source $SCRIPT_DIR/controlTemplate.sh
echo "$TEMPLATE" >> $NAME_DIR/DEBIAN/control


echo "Adding pre install script."
if [ -f "$PRE_INSTALL_SCRIPT" ]; then
  cp $PRE_INSTALL_SCRIPT $NAME_DIR/DEBIAN/preinst
  chmod +x $NAME_DIR/DEBIAN/preinst
else
  echo "No pre install script... skipping."
fi

echo "Adding post install script."
if [ -f "$POST_INSTALL_SCRIPT" ]; then
  cp $POST_INSTALL_SCRIPT $NAME_DIR/DEBIAN/postinst
  chmod +x $NAME_DIR/DEBIAN/postinst
else
echo "No post install script... skipping."
fi

echo "Adding pre remove script."
if [ -f "$PRE_REMOVE_SCRIPT" ]; then
  cp $PRE_REMOVE_SCRIPT $NAME_DIR/DEBIAN/prerm
  chmod +x $NAME_DIR/DEBIAN/prerm
else
echo "No pre remove script... skipping."
fi

echo "Adding post remove script."
if [ -f "$POST_REMOVE_SCRIPT" ]; then
  cp $POST_REMOVE_SCRIPT $NAME_DIR/DEBIAN/postrm
  chmod +x $NAME_DIR/DEBIAN/postrm
else
echo "No post remove script... skipping."
fi

echo "Building package."
dpkg-deb --build $NAME_DIR

echo "Done"