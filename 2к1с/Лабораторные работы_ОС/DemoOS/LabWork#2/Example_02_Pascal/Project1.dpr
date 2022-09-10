//---------------------------------------------------------------------------
//Демонстрационный проэкт к лабораторной работе №2
//ПЕРВАЯ ПРОГРАММА
//---------------------------------------------------------------------------
//ЗАДАНИЕ: создать программу, которая запускает на выполнение два других
//процесса, в которых выполняется несколько заполнение и последующих
//сортировок массива
//---------------------------------------------------------------------------
program Project1;

{$APPTYPE CONSOLE}

//Подключаем необходимые библиотеки
uses
  Windows,
  SysUtils;

var
  //переменная для командной строки
  cmd:String;
  //иднтификатор текущего процесса
  pid:Integer;
  //служебые переменные для хранения информации о первом процессе
  info1:^_STARTUPINFOA;
  pinfo1:^_PROCESS_INFORMATION;
  //служебые переменные для хранения информации о втором процессе
  info2:^_STARTUPINFOA;
  pinfo2:^_PROCESS_INFORMATION;
  //переменные для хранения кодов состояния процессов
  errCode1:Cardinal;
  errCode2:Cardinal;
  //признаки завершения процесса
  flag1,flag2:Boolean;
  //переменные для определения времени работы процессов
  starts1,finishs1:Cardinal;
  starts2,finishs2:Cardinal;
  titleStr:String;

begin
  { TODO -oUser -cConsole Main : Insert code here }
  //проверяем аргументы командной строки
  if (ParamCount>0) then begin
    //если указан какой либо параметр, то первый параметр принимаем за имя
    //второй программы
    cmd:=ParamStr(1);
  end else begin
    //иначе по умолчанию будет использовано имя slave.exe
    cmd:='slave.exe';
  end;
  //получаем идентификатор текущего процесса
  pid:=GetCurrentProcessId();
  //выводим его на экран
  WriteLn('Master pid - '+IntToStr(pid));
  //выделяем необходимую память для информационных структур первого процесса
  GetMem(info1,SizeOf(_STARTUPINFOA));
  GetMem(pinfo1,SizeOf(_PROCESS_INFORMATION));
  info1.cb:=SizeOf(_STARTUPINFOA);
  //выделяем необходимую память для информационных структур первого процесса
  GetMem(info2,SizeOf(_STARTUPINFOA));
  GetMem(pinfo2,SizeOf(_PROCESS_INFORMATION));
  info2.cb:=SizeOf(_STARTUPINFOA);
  //устанавливаем значения для запускаемого процесса
  WriteLn('Master: starting process 1 '+cmd);
  titleStr:='Process 1 prioritet NORMAL_PRIORITY_CLASS';
  info1.dwFlags:=STARTF_USEPOSITION;
  info1.lpTitle:=Pointer(titleStr);
  info1.dwX:=0;
  info1.dwY:=0;
  starts1:=gettickcount;
  //пытаемся запустить второй процесс первый раз
  if (Not CreateProcess(nil,
                     PChar(cmd+' 1'),
                     nil,
                     nil,
                     FALSE,
                     NORMAL_PRIORITY_CLASS or CREATE_NEW_CONSOLE,
                     nil,
                     nil,
                     info1^,
                     pinfo1^)) then begin
    WriteLn('Master: Slave1 was not running!');
    WriteLn('Master: Check argument string!');
    Halt(1);
  end;
  //устанавливаем значения для запускаемого процесса
  WriteLn('Master: starting process 2 '+cmd);
  titleStr:='Process 2 prioritet NORMAL_PRIORITY_CLASS';
  info2.dwFlags:=STARTF_USEPOSITION;
  info2.lpTitle:=Pointer(titleStr);
  info2.dwX:=10;
  info2.dwY:=10;
  starts2:=gettickcount;
  //пытаемся запустить второй процесс первый раз
  if (Not CreateProcess(nil,
                     PChar(cmd+' 2'),
                     nil,
                     nil,
                     FALSE,
                     NORMAL_PRIORITY_CLASS or CREATE_NEW_CONSOLE,
                     nil,
                     nil,
                     info2^,
                     pinfo2^)) then begin
    WriteLn('Master: Slave2 was not running!');
    WriteLn('Master: Check argument string!');
    Halt(1);
  end;
  //выводим собщение о приостановке первой программы
  WriteLn('Master: sleeping');
  //флаги состояния процессов делаем истинными
  flag1:=true;
  flag2:=true;
  //в бесконечном цикле проверяем состояния процессов
  while(true) do begin
    //получаем кода состояния
    GetExitCodeProcess(pinfo1.hProcess, errCode1);
    GetExitCodeProcess(pinfo2.hProcess, errCode2);
    //проверяем завершен ли первый процесс
    if not(errCode1=STILL_ACTIVE)and flag1 then begin
      //если процесс завершен, выводим информацию о времени его исполнения
      if (errCode1=0) then writeln('Slave1: finished')
      else writeln('Slave1: abnormal finished');
      finishs1:=gettickcount;
      WriteLn('Minutes:'+IntToStr((finishs1-starts1)div 60000 mod 60));
      WriteLn('Seconds:'+IntToStr((finishs1-starts1)div 1000 mod 60));
      WriteLn('MiliSeconds:'+IntToStr((finishs1-starts1)mod 1000));
      flag1:=false;
    end;
    //проверяем завершен ли второй процесс
    if not(errCode2=STILL_ACTIVE)and flag2 then begin
      //если процесс завершен, выводим информацию о времени его исполнения
      if (errCode2=0) then writeln('Slave2: finished')
      else writeln('Slave2: abnormal finished');
      finishs2:=gettickcount;
      WriteLn('Minutes:'+IntToStr((finishs2-starts2)div 60000 mod 60));
      WriteLn('Seconds:'+IntToStr((finishs2-starts2)div 1000 mod 60));
      WriteLn('MiliSeconds:'+IntToStr((finishs2-starts2)mod 1000));
      flag2:=false;
    end;
    //если оба процесса завершились, выходим из цикла
    if not((errCode1=STILL_ACTIVE)or(errCode2=STILL_ACTIVE)) then break;
  end;
  //завершаем работу программы
  WriteLn('Master: exiting');
end.
