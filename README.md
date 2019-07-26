# exiftool-healing-potion
A user-friendly (quick &amp; dirty) way to fix images failing KOST-Val validation

## Problem

Our users are instructed to validate all image files using [KOST-Val](https://github.com/KOST-CECO/KOST-Val) before uploading them into our Digital Asset Management solution.

While KOST-Val makes the validations-process easy, the found errors and warning messages are usually not directly actionable for our users, because many of them have neither suitable software nor the know-how required to fix faulty images.

We found that ExifTool can fix many of the problems frequently found in our files.

## ExifTool

Phil Harvey's amazing [ExifTool](https://www.sno.phy.queensu.ca/~phil/exiftool/) may be used to fix metadata problems in JPEG images by deleting all metadata and rebuilding it from scratch, see https://www.sno.phy.queensu.ca/~phil/exiftool/faq.html#Q20.

* ExifTool deletes all metadata then copies all writable tags that can be extracted from the original image to the same locations in the updated image. Some metadata from the original image may get lost in the process.
* ExifTool will not modify the JPEG image data, so if the image itself is corrupted (eg. if you get a message saying "Not a valid JPEG"), then ExifTool can not be used to repair the image.
* **ExifTool may not be used like this to repair TIFF-based files** – the risk of image corruption is too great because the image is stored in the same [Image File Directory (IFD)](https://archive.org/details/mac_Graphics_File_Formats_Second_Edition_1996/page/n913) as the metadata in these files.
* ExifTool automatically backs up the original images, suffixing the filenames with "_original".

## User-friendly wrapper for Windows

To enable users to rewrite the files without having to use the command line, our IT department has packaged the ExifTool command into a batch file with .cmd filename extension file which in turn is being called via Windows Explorer using a context menu item (right click menu) for folders.

![Screenshot of context menu item.](https://github.com/wadoli/exiftool-healing-potion/blob/master/img/kontextmenuerweiterung.png)

Users clicking on the context menu item see a command line window with some more information before and after the ExifTool output.

![Screenshot of sample output shown to users.](https://github.com/wadoli/exiftool-healing-potion/blob/master/img/beispieloutput.png)

### Restrictions

* **This is not part of KOST-Val.** We package and distribute it together with KOST-Val and have phrased the (German-language) messages for our users accordingly.
* **This is not supported software and not provided by my employer.** The script's author Franco Schön has agreed to let me share it publicly, though.
* **Our solution is not a fix for all problems that KOST-Val can identify in files.** It is mainly a solution to discard problematic meta data in JPEG files. That being said: despite Phil Harvey's words of warning we have also used it with some success on TIFF files containing problematic meta data.
* **Using the context menu item users might corrupt TIFF files and other image files in the given directory or loose important meta data stored in the files.** This is acceptable for our use case since the users subsequently check the files and add meta data after uploading them into our DAM solution.
* You need to download the ExifTool Windows Executable from the ExifTool homepage https://www.sno.phy.queensu.ca/~phil/exiftool/ for the script to function.
* In our case the ExifTool Windows Executable and the CMD file are packaged and distributed with KOST-Val in the directory containing KOST-Val. You need to adjust the path of the CMD file and the ExifTool binary if you have placed the script and binary in different file locations.
* The script only functions correctly if the system code page matches the character set used for the folder names and file names. A filename character set is not passed to ExifTool. The warning normally issued by ExifTool if folder or file names contain special characters has been disabled. See https://www.sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html#WINDOWS-UNICODE-FILE-NAMES for more information.
* Changes are only applied to files located directly in the selected folder. See https://www.sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html#Processing-control on how to enable recursively processing files in subdirectories.
