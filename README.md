# Mattermost Incoming Webhook ���e�c�[��

## ����͂ȂɁH
Incoming Webhook(�������E�F�u�t�b�N)���g���ē���`�����l���Ƀ��b�Z�[�W�𓊍e����c�[���ł��B

## ���O����
�u�����@�\�v���u�������E�F�u�t�b�N�v���쐬���AURL���T���Ă����Ă��������B

## �g����
1. `presets/sample.json`���Q�l�ɁA`presets/***.json`���쐬���Ă��������B  
   ```json
   (�ݒ��)
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
   | Key           | ����                                                                   | Value Type |
   | :------------ | :--------------------------------------------------------------------- | :--------- |
   | WebhookUrl    | Webhook��URL(���O�����ōT���Ă���������)                               | String     |
   | TargetChannel | ���e����`�����l����(���\�����ł͂Ȃ��AURL�Ɍ���Ă�����BDM���w��\) | String     |
   | DisplayName   | ���[�U�[���̕����ɕ\�����閼��                                         | String     |
   | MentionDests  | �����V������(�����V�������Ȃ��ꍇ�͋�z����w��)                       | String[]   |
   | IconEmoji     | �G�����A�C�R��(���e�҃A�C�R���̑���ɕ\��)                           | String     |
   | Text          | ���e����e�L�X�g                                                       | String     |
2. ���b�Z�[�W���e�o�b�`(`post_message.bat`)�������t���Ŏ��s���܂��B
   - ����
     - ��1����: �v���Z�b�g��(`presets/***.json`)��`***`�̕���
     - ��2����(�I�v�V���i��): ���e����e�L�X�g(���w�肵���ꍇ�A�v���Z�b�gjson�ɋL�ڂ����e�L�X�g�̑���ɂ����炪���e����܂�)
   - ���s��  
     �v���Z�b�g`sample.json`���g���ē��e���܂��B  
     ```bat
     > post_message.bat sample
     ```  
     ���e��͂��̂܂܁A���I�Ƀe�L�X�g��ς������ꍇ�A���e����e�L�X�g���2�����ɒ��ڎw�肵�܂��B  
     ```bat
     > post_message.bat sample ����ɂ��́A���E
     ```

## ���̑�
����A���P�v�]�Ȃǂ���Ώ��т܂ŁB
