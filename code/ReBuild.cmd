:: Autor: Franco Sch�n
:: Date.: 02.07.2019
:: Folio: 210585
:: Req..: exiftool.exe

@color 1f
@echo off

@CHCP 1252 >NUL

Set ae=abh�ngig
Set oe=Gr�sse
Set go=ge�ffnet
Set ue=�

@CHCP 850 >NUL


@Title KOST-Val: Alle Bilddateien im Verzeichnis neu schreiben...

@echo. ����������������������� KOST-Val ���������������������������Ŀ
@echo. �                                                            �
@echo. � Bitte warten, die Erneuerung der Dateien wird vorbereitet. �
@echo. �                                                            �
@echo. � Auf einem Netzlaufwerk kann dieser Vorgang %ae% von    �
@echo. � der %oe% der Dateien sehr viel Zeit in Anspruch nehmen!  � 
@echo. �                                                            �
@echo. ������������������������������������������� Start: %time:~0,8% ��
@echo. 

:: Usage
"%~dp0exiftool.exe" -lang de -charset filename="" -all= -tagsfromfile @ -all:all -unsafe -icc_profile %*

@echo. 
@echo. ����������������������� KOST-Val ���������������������������Ŀ
@echo. �                                                            �
@echo. � + Alle Bilddateien im Verzeichnis wurden neu geschrieben.  �
@echo. � - Nicht lesbare Metadaten wurden dabei verworfen.          �
@echo. �                                                            �
@echo. ��������������������������������������������� End: %time:~0,8% ��
@echo. 
@echo. Verzeichnis: %1

@echo. 
@echo. ** Das Verzeichnis wird nach Dr%ue%cken einer beliebigen Taste automatisch %go%. ** 
@echo. 

pause >NUL

@explorer "%1"

exit
