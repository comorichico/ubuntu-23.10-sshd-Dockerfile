# ubuntu-23.10-sshd-Dockerfile
SSH接続できるコンテナのDokcerfile

podman用に書いてますがpodmanの個所をdockerに変えたらdockerでも動くかもです。

マインクラフト用にしようと思ってSSHとMinecraftのポートだけ開けてます。

Dockerfileの編集

kokonipasswordの2か所を好きなパスワードに変更してください。

usernonamaeが4か所くらいあると思いますが好きなユーザー名に変更してください。

Dockerfileが入っているフォルダの中で以下のコマンド

podman build -t ubuntusshd .

次のコマンドでコンテナを起動

screen -S ubuntusshd

podman run --name ubuntusshd -p XXXXX:22 -p YYYYY:25565 ubuntusshd

Ctrl+A、Dでscreenをデタッチする

何か失敗したら「podman rm -f ubuntusshd」でコンテナを削除して

「podman rmi ubuntusshd」でイメージも削除してDockerfileを編集するところからやり直すといいかも。
