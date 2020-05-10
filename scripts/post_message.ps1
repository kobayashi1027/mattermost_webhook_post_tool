Param(
    [parameter(mandatory=$true)]$presetJsonName,
    $overrideText # 上書きメッセージ
)

# スクリプトディレクトリのパスをセット
# MEMO: PowerShellのバージョンによって取得方法が異なる
if( $PSVersionTable.PSVersion.Major -ge 3 ){
    $scriptDir = $PSScriptRoot
}
else{
    $scriptDir = Split-Path $MyInvocation.MyCommand.Path -Parent
}

# プリセットフォルダへ移動
Set-Location $scriptDir\..\presets

# プリセット読み込み(プリセットファイルがなければ終了)
if (!(Test-Path "${presetJsonName}.json")) {
    Write-Output "エラー： 指定されたプリセット「$($presetJsonName)」に対応するjsonファイルが存在しません。"
    exit 1
}
$preset = ConvertFrom-Json -InputObject (Get-Content "${presetJsonName}.json" -Raw)

# postするテキストを作成
$postText = $preset.Text
if ($overrideText) {
    $postText = $overrideText
}
# メンション指定あれば先頭に追加
$mentionDests = ($preset.MentionDests | % { "@$_" }) -join " "
if ($mentionDests) {
    $postText = "$($mentionDests) " + $postText
}

# incoming webhookのURLへhttpリクエストを送信
$postUri = "$($preset.WebhookUrl)"
$postBody =
    @{ `
        "channel" = "$($preset.TargetChannel)"; `
        "username" = "$($preset.DisplayName)"; `
        "icon_emoji" = "$($preset.IconEmoji)"; `
        "text" = "$($postText)"; `
    } | ConvertTo-Json -Compress
$postBody = [Text.Encoding]::UTF8.GetBytes($postBody)
Invoke-RestMethod -Method POST -Uri $postUri -Body $postBody -ContentType application/json
