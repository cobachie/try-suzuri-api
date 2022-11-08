## セットアップ

```
$ brew install imagemagick
```

## ImageMagickで画像を切り抜く

1. マスク画像を作成する
```
$ magick original.png -blur 10x5 -threshold 90% -transparent "#FFFFFF" mask.png
```

2. 被写体を切り抜く
```
$ magick composite -compose DstIn mask.png original.png -alpha Set out.png
```
