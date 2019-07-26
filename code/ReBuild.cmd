:: Autor: Franco Schön
:: Date.: 02.07.2019
:: Folio: 210585
:: Req..: exiftool.exe

@color 1f
@echo off

@CHCP 1252 >NUL

Set ae=abhängig
Set oe=Grösse
Set go=geöffnet
Set ue=ü

@CHCP 850 >NUL


@Title KOST-Val: Alle Bilddateien im Verzeichnis neu schreiben...

@echo. ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ KOST-Val ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
@echo. ³                                                            ³
@echo. ³ Bitte warten, die Erneuerung der Dateien wird vorbereitet. ³
@echo. ³                                                            ³
@echo. ³ Auf einem Netzlaufwerk kann dieser Vorgang %ae% von    ³
@echo. ³ der %oe% der Dateien sehr viel Zeit in Anspruch nehmen!  ³ 
@echo. ³                                                            ³
@echo. ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Start: %time:~0,8% ÄÙ
@echo. 

:: Usage
"%~dp0exiftool.exe" -lang de -charset filename="" -all= -tagsfromfile @ -all:all -unsafe -icc_profile %*

@echo. 
@echo. ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ KOST-Val ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
@echo. ³                                                            ³
@echo. ³ + Alle Bilddateien im Verzeichnis wurden neu geschrieben.  ³
@echo. ³ - Nicht lesbare Metadaten wurden dabei verworfen.          ³
@echo. ³                                                            ³
@echo. ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ End: %time:~0,8% ÄÙ
@echo. 
@echo. Verzeichnis: %1

@echo. 
@echo. ** Das Verzeichnis wird nach Dr%ue%cken einer beliebigen Taste automatisch %go%. ** 
@echo. 

pause >NUL

@explorer "%1"

exit
