  
  BeeHex  version 1.02
  ====================


  BeeHex requires emu8086 to be installed, otherwise it may not work,
  because it uses some specific Microsoft libraries for the mission.
  You may download the libraries separately from BeeHex website:
  http://www.emu8086.com/BeeHex

  To open files just drag them onto the BeeHex window.

    1) BeeHex immediately writes any changes to file in real time,
       this is very handy to debug IO emulation
       for emu8086 - microprocessor emulator: c:\emu8086.io
       Backup important files before BeeHexing them.
       Make sure that no other application opens this file
       in exclusive mode. All applications must open the file
       in shared mode, otherwise changes won't be saved.

    2) BeeHex constantly monitors opened file for changes,
       even if changes are made by another program.
       These changes are shown in red.
       This is again very handy for emu8086 - microprocessor emulator,
       when we use OUT instruction to write some data to a port
       we can monitor in real time what happens out there.
       For example:

        start:
        out 1, al
        inc al
        jmp start

  To go at specified offset press Ctrl+G. Offset must be given in HEX.
  
  By default BeeHex dumps the input to "temp.bin".
  To reset: close BeeHex and delete this file.
  
  To create new file, select "File" > "New" > "Text document" in Windows Explorer.
  Rename "New Text Document.txt" to "my.bin", then drag the file to BeeHex to edit it.
  See also recomendation for Windows XP users here:
  http://www.emu8086.com/dr/emu8086_assembler_solutions_faq.html
  
  
  BeeHex Files
  ============
 
  BeeHex.exe    -   BeeHex. RealTime Hex Editor.
 
  ReadMe.txt    -   You are reading it.    
 
  test.bin      -   Test BOOT record for any floppy (made by BeeHex)
                      To test:
                        Use empty (unformatted) floppy.
                        Get "CmdHere" from Microsoft (free).
                        Right click the BeeHex folder.
                        From DOS console type:
                          writebin test.bin

  writebin.com  -   Floppy boot record writer (source is in emu8086 examples)
  
  [temp.bin]    -   Temporary dump file. It is used only if you do not open any
                    file and start to make the input. You may rename it or delete
                    this file when BeeHex is not using it.


  BeeHex automatically appends bytes to file if you start making changes after
  current file's end. It's possible to invoke BeeHex from a command line.
  BeeHex is ideal for editing small binary files.

  BeeHex License
  ==============
  Freeware. Use at your own risk. When distributing, please keep all files together.
  Do not distribute modified or corrupted files.



