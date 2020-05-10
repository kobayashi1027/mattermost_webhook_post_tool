Param(
    [parameter(mandatory=$true)]$presetJsonName,
    $overrideText # �㏑�����b�Z�[�W
)

# �X�N���v�g�f�B���N�g���̃p�X���Z�b�g
# MEMO: PowerShell�̃o�[�W�����ɂ���Ď擾���@���قȂ�
if( $PSVersionTable.PSVersion.Major -ge 3 ){
    $scriptDir = $PSScriptRoot
}
else{
    $scriptDir = Split-Path $MyInvocation.MyCommand.Path -Parent
}

# �v���Z�b�g�t�H���_�ֈړ�
Set-Location $scriptDir\..\presets

# �v���Z�b�g�ǂݍ���(�v���Z�b�g�t�@�C�����Ȃ���ΏI��)
if (!(Test-Path "${presetJsonName}.json")) {
    Write-Output "�G���[�F �w�肳�ꂽ�v���Z�b�g�u$($presetJsonName)�v�ɑΉ�����json�t�@�C�������݂��܂���B"
    exit 1
}
$preset = ConvertFrom-Json -InputObject (Get-Content "${presetJsonName}.json" -Raw)

# post����e�L�X�g���쐬
$postText = $preset.Text
if ($overrideText) {
    $postText = $overrideText
}
# �����V�����w�肠��ΐ擪�ɒǉ�
$mentionDests = ($preset.MentionDests | % { "@$_" }) -join " "
if ($mentionDests) {
    $postText = "$($mentionDests) " + $postText
}

# incoming webhook��URL��http���N�G�X�g�𑗐M
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
