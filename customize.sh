SKIPUNZIP=1
ASH_STANDALONE=1

status=""
data_dir="/data/adb/JeelsBypasser"

if [ $BOOTMODE ! = true ] ; then
  abort "Error: please install from Magisk Manager!"
fi
unzip -o "${ZIPFILE}" -x 'META-INF/*' -d $MODPATH >&2

ui_print "- Move all data..."
rm -rf "${data_dir}"
mv -f ${MODPATH}/JeelsBypasser ${data_dir}

ui_print "- Settings permissions..."
set_perm_recursive ${MODPATH} 0 0 0755 0644
set_perm_recursive ${data_dir} 0 0 0755 0644
set_perm_recursive ${data_dir}/start 0 0 0755 0755
set_perm_recursive ${data_dir}/JeelsBoobz 0 0 0755 0755
set_perm_recursive ${data_dir}/JeelsBoobz.inotify 0 0 0755 0755
set_perm  ${MODPATH}/service.sh  0  0  0755
set_perm  ${MODPATH}/uninstall.sh  0  0  0755

ui_print "- Force enable module..."
rm -Rf ${MODPATH}/disable

ui_print "- Reboot to enjoy..."
sleep 3
reboot