Rem ----------------------------------   ˵  ��   ---------------------------------- 
Rem --------------------------------------------------------------------------------
Rem ----------------- -------------  �����̿ռ�  ---------------------------------   
Rem -----------------------		Creat by Sunhm@20170621  ---------------------------
Rem ---------------------------------����1:�̷� ------------------------------------
Rem -------------------����call %~dp0\sub_check_disk_space D --------------
Rem --------------------------------------------------------------------------------

Rem --------------------------------  ���ñ�����ʼ  --------------------------------

if "%Global_Checkdisk_DiskRange%"=="" (set Global_Checkdisk_DiskRange=C) else (echo ������������%Global_Checkdisk_DiskRange% ) 
Rem ������Ҫ���ռ���̷�
Rem set Global_Checkdisk_DiskRange=C D E F G H I J K L M N O P Q R S T U V W X Y Z
if "%1"=="" (echo ��� %Global_Checkdisk_DiskRange%�̿ռ�) else (set Global_Checkdisk_DiskRange=%1%)

Rem --------------------------------  ���ñ�������  --------------------------------

Rem ����������չ
rem setlocal EnableDelayedExpansion

for %%i in (%Global_Checkdisk_DiskRange%) do (

if exist %%i: for /f "tokens=3" %%j in ('dir /-c %%i: ^|find "�����ֽ�"') do (

set space=%%j

set space=!space:~0,-3!

set /a space=!space!/1024/1024

for /f "tokens=3*" %%v in ('vol %%i:') do set volume=%%w

echo %%i:!volume! ʣ�� !space! GB���� >>%Global_Bat_HOME%\log\sucess.log
echo %%i:!volume! ʣ�� !space! GB���� 
)
set Global_Checkdisk_DiskSpace=%%i:!volume!ʣ��!space!GB����
)

Rem �ر�������չ
rem setlocal disabledelayedexpansion

set Global_Checkdisk_DiskSpace=%space%
set Local_Checkdisk_DiskSpace=%space%
echo %Global_Checkdisk_DiskSpace%
