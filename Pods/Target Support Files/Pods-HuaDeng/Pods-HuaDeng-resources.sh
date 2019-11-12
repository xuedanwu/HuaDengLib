#!/bin/sh
set -e
set -u
set -o pipefail

function on_error {
  echo "$(realpath -mq "${0}"):$1: error: Unexpected failure"
}
trap 'on_error $LINENO' ERR

if [ -z ${UNLOCALIZED_RESOURCES_FOLDER_PATH+x} ]; then
  # If UNLOCALIZED_RESOURCES_FOLDER_PATH is not set, then there's nowhere for us to copy
  # resources to, so exit 0 (signalling the script phase was successful).
  exit 0
fi

mkdir -p "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=()

# This protects against multiple targets copying the same framework dependency at the same time. The solution
# was originally proposed here: https://lists.samba.org/archive/rsync/2008-February/020158.html
RSYNC_PROTECT_TMP_FILES=(--filter "P .*.??????")

case "${TARGETED_DEVICE_FAMILY:-}" in
  1,2)
    TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
    ;;
  1)
    TARGET_DEVICE_ARGS="--target-device iphone"
    ;;
  2)
    TARGET_DEVICE_ARGS="--target-device ipad"
    ;;
  3)
    TARGET_DEVICE_ARGS="--target-device tv"
    ;;
  4)
    TARGET_DEVICE_ARGS="--target-device watch"
    ;;
  *)
    TARGET_DEVICE_ARGS="--target-device mac"
    ;;
esac

install_resource()
{
  if [[ "$1" = /* ]] ; then
    RESOURCE_PATH="$1"
  else
    RESOURCE_PATH="${PODS_ROOT}/$1"
  fi
  if [[ ! -e "$RESOURCE_PATH" ]] ; then
    cat << EOM
error: Resource "$RESOURCE_PATH" not found. Run 'pod install' to update the copy resources script.
EOM
    exit 1
  fi
  case $RESOURCE_PATH in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile ${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc $RESOURCE_PATH --sdk ${SDKROOT} ${TARGET_DEVICE_ARGS}" || true
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc" "$RESOURCE_PATH" --sdk "${SDKROOT}" ${TARGET_DEVICE_ARGS}
      ;;
    *.xib)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile ${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .xib`.nib $RESOURCE_PATH --sdk ${SDKROOT} ${TARGET_DEVICE_ARGS}" || true
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .xib`.nib" "$RESOURCE_PATH" --sdk "${SDKROOT}" ${TARGET_DEVICE_ARGS}
      ;;
    *.framework)
      echo "mkdir -p ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}" || true
      mkdir -p "${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync --delete -av "${RSYNC_PROTECT_TMP_FILES[@]}" $RESOURCE_PATH ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}" || true
      rsync --delete -av "${RSYNC_PROTECT_TMP_FILES[@]}" "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH"`.mom\"" || true
      xcrun momc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd\"" || true
      xcrun momc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm\"" || true
      xcrun mapc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ABSOLUTE_XCASSET_FILE="$RESOURCE_PATH"
      XCASSET_FILES+=("$ABSOLUTE_XCASSET_FILE")
      ;;
    *)
      echo "$RESOURCE_PATH" || true
      echo "$RESOURCE_PATH" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
if [[ "$CONFIGURATION" == "Debug" ]]; then
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha/dicTRIGER_BaoZha_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha/dicTRIGER_BaoZha_Mod2_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha/dicTRIGER_BaoZha_Mod3_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha/dicTRIGER_BaoZha_Mod4_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod2_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod3_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod4_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod5_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod6_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/eyes_yanlei2_20161026122737/dicEYES_YanLei2_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/glasses_shiwu12_20161026140917/dicGLASSES_ShiWu12_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_huangguan2_20170718184130/w718_7huangguan_mod1_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_huangguan2_20170718184130/w718_7huangguan_mod2_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_huangguan2_20170718184130/w718_7huangguan_mod3_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_tu_20170609100554/head_6.8-8tu_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_tu_20170609100554/head_6.8-8tu_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/mouth_shiwu4_20161026143204/dicMOUTH_ShiWu4_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724/nose_5.27-7mao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724/nose_5.27-7mao_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724/nose_5.27-7mao_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724/nose_5.27-7mao_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture5.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502/nose_5.25-7mao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502/nose_5.25-7mao_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502/nose_5.25-7mao_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502/nose_5.25-7mao_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17/nose_6.20-7mao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17/nose_6.20-7mao_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17/nose_6.20-7mao_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17/nose_6.20-7mao_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig/w718_7xiaozhu_mod1_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig/w718_7xiaozhu_mod2_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig/w718_7xiaozhu_mod3_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig/w718_7xiaozhu_mod4_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/text_yuema_20161026153650/dicTEXT_YueMa_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_tiaotiaomao_20170118182855/head_tiaotiaomao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture5.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture5.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture5.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/eyes_yanlei2_20161026122737.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/glasses_shiwu12_20161026140917.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_huangguan2_20170718184130.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_tu_20170609100554.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/mouth_shiwu4_20161026143204.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/text_yuema_20161026153650.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_tiaotiaomao_20170118182855.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/WT_Resources.bundle"
fi
if [[ "$CONFIGURATION" == "Release" ]]; then
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha/dicTRIGER_BaoZha_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha/dicTRIGER_BaoZha_Mod2_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha/dicTRIGER_BaoZha_Mod3_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha/dicTRIGER_BaoZha_Mod4_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod2_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod3_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod4_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod5_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen/dicTRIGER_CaiShen_Mod6_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake/triger_shengri1-17_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/eyes_yanlei2_20161026122737/dicEYES_YanLei2_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/glasses_shiwu12_20161026140917/dicGLASSES_ShiWu12_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_huangguan2_20170718184130/w718_7huangguan_mod1_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_huangguan2_20170718184130/w718_7huangguan_mod2_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_huangguan2_20170718184130/w718_7huangguan_mod3_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_tu_20170609100554/head_6.8-8tu_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_tu_20170609100554/head_6.8-8tu_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/mouth_shiwu4_20161026143204/dicMOUTH_ShiWu4_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724/nose_5.27-7mao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724/nose_5.27-7mao_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724/nose_5.27-7mao_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724/nose_5.27-7mao_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205/nose_lvtuzi-9_Texture5.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502/nose_5.25-7mao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502/nose_5.25-7mao_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502/nose_5.25-7mao_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502/nose_5.25-7mao_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17/nose_6.20-7mao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17/nose_6.20-7mao_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17/nose_6.20-7mao_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17/nose_6.20-7mao_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig/w718_7xiaozhu_mod1_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig/w718_7xiaozhu_mod2_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig/w718_7xiaozhu_mod3_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig/w718_7xiaozhu_mod4_tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404/nose_jiandanmao-12_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/text_yuema_20161026153650/dicTEXT_YueMa_Mod1_Tex.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546/triger_6.5-7taoyan_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_tiaotiaomao_20170118182855/head_tiaotiaomao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110/triger_xiaojixiaoji_Texture5.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao/triger_zhaocaimao_Texture5.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture0.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture1.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture2.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture3.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture4.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8/triger_yurenjie8-7_Texture5.png"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/baozha.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/caishen.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/cake.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/eyes_yanlei2_20161026122737.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/glasses_shiwu12_20161026140917.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_huangguan2_20170718184130.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/head_tu_20170609100554.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/mouth_shiwu4_20161026143204.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_cat10_20170527171724.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_lvtuzi_20170411154205.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao10_20170525175502.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_mao17.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_pig.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/nose_shouhuimao_20170413185404.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/text_yuema_20161026153650.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_taoyan_20170605184546.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_tiaotiaomao_20170118182855.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_xiaojixiaoji_20161230135110.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/triger_zhaocaimao.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/pic/yurenjie8.json"
  install_resource "${PODS_ROOT}/../HuaDengLib/HuaDengLib/Classes/AppStore/WuTaSDK/WT_Resources.bundle"
fi

mkdir -p "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]] && [[ "${SKIP_INSTALL}" == "NO" ]]; then
  mkdir -p "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n "${XCASSET_FILES:-}" ]
then
  # Find all other xcassets (this unfortunately includes those of path pods and other targets).
  OTHER_XCASSETS=$(find "$PWD" -iname "*.xcassets" -type d)
  while read line; do
    if [[ $line != "${PODS_ROOT}*" ]]; then
      XCASSET_FILES+=("$line")
    fi
  done <<<"$OTHER_XCASSETS"

  if [ -z ${ASSETCATALOG_COMPILER_APPICON_NAME+x} ]; then
    printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${!DEPLOYMENT_TARGET_SETTING_NAME}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
  else
    printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${!DEPLOYMENT_TARGET_SETTING_NAME}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}" --app-icon "${ASSETCATALOG_COMPILER_APPICON_NAME}" --output-partial-info-plist "${TARGET_TEMP_DIR}/assetcatalog_generated_info_cocoapods.plist"
  fi
fi
