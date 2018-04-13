# 『手続き Haskell』サンプルコード

これは『手続き Haskell』のサンプルコードです。

書籍ページ：http://doujin.kakkun61.com/procedural-haskell

## コンパイル・実行方法

reference 以下にある Main00.hs をコンパイルしてできた ioref-sample-00 を実行するには下記のようにします。
どのソースファイルをコンパイルするとどういう名前の実行ファイルになるかは各ディレクトリーの .cabal ファイルを見てください。

```
stack build reference --exec ioref-sample-00
```

もしくは下記。

```
stack build reference
stack exec ioref-sample-00
```
