
Rem -------------------------------  ˵  ��   -------------------------------------- 
Rem --------------------------------------------------------------------------------
Rem ---------------------------  ɾ��SAP�����ļ�  ----------------------------------
Rem --------------------------------------------------------------------------------
Rem --------------------------------------------------------------------------------   
Rem -----------------------		Creat by Sunhm@20170621  ---------------------------
Rem --------------------------------------------------------------------------------
Rem --------------------------------------------------------------------------------


Rem @@@forfiles�÷�
Rem @  /p ָ����·��
Rem @  /s ������Ŀ¼
Rem @  /m ���ҵ��ļ�������
Rem @  /d ָ������,�о������ں��������, �˴�-7ָ��ǰ���� ��7��ǰ   


Rem @��Ŀ¼ %SrcDir% ָ��������ǰ��Ŀ¼���ļ�����cmd /c del /f /q /a @path && rd /s /q @path����

Rem @del /f /q /a ǿ��ɾ��ֻ���ļ�

Rem forfiles /p %SrcDir% /s /m *.* /d -%DaysAgo% /c "cmd /c del /f /q /a @path"

Rem forfiles /p %SrcDir% /s /m *.* /d -%DaysAgo% /c "cmd /c echo ����ɾ����@path"

forfiles /p "%Global_Del_Sapdatebackup_SrcDir%" /s /d -%Global_Del_Sapdatebackup_DaysAgo% /c "cmd /c echo ����ɾ����[@file]�����ļ��ϴ��޸�ʱ�䣺[@fdate @ftime] && del /f /q /a @file && rd /s /q @path && echo ��־���� @path �Ѿ�ɾ��,ɾ������: %GlobalToday%>>%~dp0\log\delete_data.log" 


rem if %ERRORLEVEL% EQU 0 (echo ɾ����־�ɹ�,ɾ������: %Global_Today%>>%~dp0\log\sucess.log) else (echo ɾ����־ʧ��,ɾ������: %Global_Today%>>%~dp0\log\erro.log)