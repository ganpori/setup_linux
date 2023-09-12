# --rotation 180 はその時のカメラの設置位置しだい。０か180しかだめらしい。
# --datetimeをつけるとシステムの時刻を使ってMMDDhhmmss.jpgのファイルを作る
datetime=`date '+%Y%m%d%H%M%S'`  # ファイル名に使う撮影時刻文字列

 /usr/bin/libcamera-still -o $datetime.jpg  --rotation 180