
# オンラインプログラミング採用　備考

## 作業内容

- 取り敢えずDockerでRubyの環境構築
- docker内でpryを実行し、ちょこちょこAPIを叩く
  - 問題を把握し、状況理解
- 条件の理解
  - 送信する文字列は50字
  - 文字列は「ABCD」のみ
  - 1~8文字でなる配当を持つ組み合わせが1000種
- とりあえず、高い配当の組み合わせを探す
  - １～３文字の組み合わせを探し始める
- APIを叩くのに１秒間隔を開けないといけないと気づく
  - 焦る
- 組み合わせ1000種を探し出すためのロジックが必要。
  - ロジックを考え始める
  - 思考時間がもったいないので、取り敢えず50文字をランダム生成して送りまくる
    - 運良く1000点以上の組み合わせがちらほら
- CSVをDBに見立て、配当を持つ組み合わせを保存していき、1000種類当てる方針を取る
  - が、どのみち総当りで探さないと配当高いものを探すのは無理
  - 1000種類を探し出すのを諦める
- randomロジックで配当高い文章を見て、配当が高いものに対して法則性がないかを考え出す
  - が、わからない
- 配当の高い文章をいくつかチョイスし、人力で配当の高い8文字を探し出す。
  - 8文字のみで300点を超える組み合わせを発見
- 配当の高い組み合わせの前後4文字を含む別の組み合わせを探し、50文字の高配当を目指す
  - このとき、「Z」などを用いて8文字区切りでAPIの探査が可能なことに気づく。残り既に1時間程度
- Zを区切り文字とし、とにかくAPIを実行しまくり、ある程度高い配点があるものを人力で分解し、高配当を見つける
- 高配当同士を組み合わせ、16文字の高配当な組み合わせを作成する。
- 大体800点前後の16文字程度の文章を３つ作成完了
- その3つの順序を適当に探し、2000点を超える。
- Game End

## 反省会

- 総当りによる配点探しは難しい。
  - もっと早めに見切りをつけて別のことに思考をさくべきだった。
- 「Z」など適当な区切り文字で8文字組み合わせの探索をより高速化できるのに早く気づくべきだった。
- 時間がなくなってきた時点で焦り、割と人力操作が多くなってしまった
  - 8文字配点探しのときに、300点を超えたらZを分解し、それぞれAPIを実行して8文字の高配当を探す...
  - のように思考を切り替えられなかったのが無念
- そもそも、Dockerの準備くらい最初にしておくべき
