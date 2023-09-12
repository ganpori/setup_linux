# --rotation 180 はその時のカメラの設置位置しだい。０か180しかだめらしい。
# --datetimeをつけるとシステムの時刻を使ってMMDDhhmmss.jpgのファイルを作る
datetime=`date '+%Y%m%d%H%M%S'`  # ファイル名に使う撮影時刻文字列
degree_rotation=180  # カメラが反転してるから。0か180しか指定できないらしい
savedirname='camera_images'

mkdir $savedirname # 保存先を作成

 /usr/bin/libcamera-still -o $savedirname/${datetime}_auto.jpg  --rotation $degree_rotation