# 概要
キャラクター交流型ウェブゲーム共通基幹システム"Lunchtote"のDocker開発環境構築を一括で行います。
VSCodeのDev Containersなどを用い、コンテナ内部で開発を行うことを想定しています。

# セットアップ方法
```
Windowsの場合、まずはGit Bashをインストールしてください。Gitをインストールするとついてきます。
https://gitforwindows.org/
```

1. dockerとdocker-composeをインストールします。インストール後、ターミナルで`docker -v`と`docker-compose -v`を実行してバージョンが正常に返ってくることを確認してください。

2. `.config/git/.gitconfig`を開き、git上で使用するメールアドレスと名前を記入します。

3. `ssh-keygen`コマンドを実行し、**パスフレーズなし**の鍵ペアを生成してください。パスフレーズありで生成してしまうと処理がコマンドライン上で完結しなくなりコケます。

4. 生成した`id_rsa`を`.config/ssh`内に入れてください。

5. 生成した`id_rsa.pub`をテキストエディタで開き、その内容を自身の[GitHubアカウントに登録](https://github.com/settings/keys)してください。

6. このREADME.mdがあるディレクトリで`ssh -T git@github.com -i .config/ssh/id_rsa`を実行し、GitHubに繋がることを確認してください。接続できた場合以下のようなレスポンスが帰ってきます。
```
Hi {AccountName}! You've successfully authenticated, but GitHub does not provide shell access.
```

7. initialize.shを実行してください。環境が一括で作成されます。途中でfingerprintの確認を求められる場合がありますが、内容を確認してOKであればyesを入力してください。

# 想定運用
このプロジェクトを各々のローカルにクローンし、適宜自分の環境に合わせて書き換えてください。起動構成の変更があった場合は各自マージしていって変更に追従します。