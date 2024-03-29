# --rotation 180 はその時のカメラの設置位置しだい。０か180しかだめらしい。
# --datetimeをつけるとシステムの時刻を使ってMMDDhhmmss.jpgのファイルを作る
datetime=`date '+%Y%m%d%H%M%S'`  # ファイル名に使う撮影時刻文字列
degree_rotation=180  # カメラが反転してるから。0か180しか指定できないらしい
savedirname='camera_images'
exposure_seconds=30  # 最大露光時間は112秒, https://www.raspberrypi.com/documentation/accessories/camera.html#hardware-specification
exposure_microseconds=$((exposure_seconds * 10**6))  # libcameraでの露光時間の単位はμ秒なので単位変換。
gain_at_long_exposure=128.0  # ふつうは１.0付近の値なんだけど暗所でやるためにデカ盛りの値。

mkdir $savedirname # 保存先を作成

# ソフトの説明。
# https://www.raspberrypi.com/documentation/computers/camera_software.html
/usr/bin/libcamera-still -o $savedirname/${datetime}_auto.jpg  --rotation $degree_rotation 
# 非常に長時間露光の画像をキャプチャするには、AEC/AGC および AWB を無効にするように注意する必要があります。無効にしないと、これらのアルゴリズムにより、ユーザーは収束するまでに多数のフレームを待機することになります。
# 長露光では実行時オプションで--immediateをつけろって公式でいってるけど動かなくなったのでとりあえずつけない
/usr/bin/libcamera-still -o $savedirname/${datetime}_long_exposure.jpg   --rotation $degree_rotation --shutter $exposure_microseconds  --gain $gain_at_long_exposure --awbgains 1,1