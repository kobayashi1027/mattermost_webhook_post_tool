# Mattermost Incoming Webhook 投稿ツール

## これはなに？
Incoming Webhook(内向きウェブフック)を使って特定チャンネルにメッセージを投稿するツールです。

## 事前準備
「統合機能」より「内向きウェブフック」を作成し、URLを控えておいてください。

## 使い方
1. `presets/sample.json`を参考に、`presets/***.json`を作成してください。  
   ```json
   (設定例)
   {
        "WebhookUrl": "http://your-mattermost-url/hooks/**************************",
        "TargetChannel": "town-square",
        "DisplayName": "Webhook Sample",
        "MentionDests": [
            "satou",
            "tanaka"
        ],
        "IconEmoji": "robot",
        "Text": "this is sample message!!"
   }
   ```  
   | Key           | 説明                                                                   | Value Type |
   | :------------ | :--------------------------------------------------------------------- | :--------- |
   | WebhookUrl    | WebhookのURL(事前準備で控えておいたもの)                               | String     |
   | TargetChannel | 投稿するチャンネル名(※表示名ではなく、URLに現れている方。DMも指定可能) | String     |
   | DisplayName   | ユーザー名の部分に表示する名称                                         | String     |
   | MentionDests  | メンション先(メンションしない場合は空配列を指定)                       | String[]   |
   | IconEmoji     | 絵文字アイコン(投稿者アイコンの代わりに表示)                           | String     |
   | Text          | 投稿するテキスト                                                       | String     |
2. メッセージ投稿バッチ(`post_message.bat`)を引数付きで実行します。
   - 引数
     - 第1引数: プリセット名(`presets/***.json`)の`***`の部分
     - 第2引数(オプショナル): 投稿するテキスト(※指定した場合、プリセットjsonに記載したテキストの代わりにこちらが投稿されます)
   - 実行例  
     プリセット`sample.json`を使って投稿します。  
     ```bat
     > post_message.bat sample
     ```  
     投稿先はそのまま、動的にテキストを変えたい場合、投稿するテキストを第2引数に直接指定します。  
     ```bat
     > post_message.bat sample こんにちは、世界
     ```

## その他
質問、改善要望などあれば小林まで。
