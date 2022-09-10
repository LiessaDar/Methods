//---------------------------------------------------------------------------
//���������������� ������ � ������������ ������ �2
//������ ���������
//---------------------------------------------------------------------------
//�������: ������� ���������, ������� ��������� �� ���������� ��� ������
//��������, � ������� ����������� ��������� ���������� � �����������
//���������� �������
//---------------------------------------------------------------------------
program Project1;

{$APPTYPE CONSOLE}

//���������� ����������� ����������
uses
  Windows,
  SysUtils;

var
  //���������� ��� ��������� ������
  cmd:String;
  //������������ �������� ��������
  pid:Integer;
  //�������� ���������� ��� �������� ���������� � ������ ��������
  info1:^_STARTUPINFOA;
  pinfo1:^_PROCESS_INFORMATION;
  //�������� ���������� ��� �������� ���������� � ������ ��������
  info2:^_STARTUPINFOA;
  pinfo2:^_PROCESS_INFORMATION;
  //���������� ��� �������� ����� ��������� ���������
  errCode1:Cardinal;
  errCode2:Cardinal;
  //�������� ���������� ��������
  flag1,flag2:Boolean;
  //���������� ��� ����������� ������� ������ ���������
  starts1,finishs1:Cardinal;
  starts2,finishs2:Cardinal;
  titleStr:String;

begin
  { TODO -oUser -cConsole Main : Insert code here }
  //��������� ��������� ��������� ������
  if (ParamCount>0) then begin
    //���� ������ ����� ���� ��������, �� ������ �������� ��������� �� ���
    //������ ���������
    cmd:=ParamStr(1);
  end else begin
    //����� �� ��������� ����� ������������ ��� slave.exe
    cmd:='slave.exe';
  end;
  //�������� ������������� �������� ��������
  pid:=GetCurrentProcessId();
  //������� ��� �� �����
  WriteLn('Master pid - '+IntToStr(pid));
  //�������� ����������� ������ ��� �������������� �������� ������� ��������
  GetMem(info1,SizeOf(_STARTUPINFOA));
  GetMem(pinfo1,SizeOf(_PROCESS_INFORMATION));
  info1.cb:=SizeOf(_STARTUPINFOA);
  //�������� ����������� ������ ��� �������������� �������� ������� ��������
  GetMem(info2,SizeOf(_STARTUPINFOA));
  GetMem(pinfo2,SizeOf(_PROCESS_INFORMATION));
  info2.cb:=SizeOf(_STARTUPINFOA);
  //������������� �������� ��� ������������ ��������
  WriteLn('Master: starting process 1 '+cmd);
  titleStr:='Process 1 prioritet NORMAL_PRIORITY_CLASS';
  info1.dwFlags:=STARTF_USEPOSITION;
  info1.lpTitle:=Pointer(titleStr);
  info1.dwX:=0;
  info1.dwY:=0;
  starts1:=gettickcount;
  //�������� ��������� ������ ������� ������ ���
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
  //������������� �������� ��� ������������ ��������
  WriteLn('Master: starting process 2 '+cmd);
  titleStr:='Process 2 prioritet NORMAL_PRIORITY_CLASS';
  info2.dwFlags:=STARTF_USEPOSITION;
  info2.lpTitle:=Pointer(titleStr);
  info2.dwX:=10;
  info2.dwY:=10;
  starts2:=gettickcount;
  //�������� ��������� ������ ������� ������ ���
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
  //������� �������� � ������������ ������ ���������
  WriteLn('Master: sleeping');
  //����� ��������� ��������� ������ ���������
  flag1:=true;
  flag2:=true;
  //� ����������� ����� ��������� ��������� ���������
  while(true) do begin
    //�������� ���� ���������
    GetExitCodeProcess(pinfo1.hProcess, errCode1);
    GetExitCodeProcess(pinfo2.hProcess, errCode2);
    //��������� �������� �� ������ �������
    if not(errCode1=STILL_ACTIVE)and flag1 then begin
      //���� ������� ��������, ������� ���������� � ������� ��� ����������
      if (errCode1=0) then writeln('Slave1: finished')
      else writeln('Slave1: abnormal finished');
      finishs1:=gettickcount;
      WriteLn('Minutes:'+IntToStr((finishs1-starts1)div 60000 mod 60));
      WriteLn('Seconds:'+IntToStr((finishs1-starts1)div 1000 mod 60));
      WriteLn('MiliSeconds:'+IntToStr((finishs1-starts1)mod 1000));
      flag1:=false;
    end;
    //��������� �������� �� ������ �������
    if not(errCode2=STILL_ACTIVE)and flag2 then begin
      //���� ������� ��������, ������� ���������� � ������� ��� ����������
      if (errCode2=0) then writeln('Slave2: finished')
      else writeln('Slave2: abnormal finished');
      finishs2:=gettickcount;
      WriteLn('Minutes:'+IntToStr((finishs2-starts2)div 60000 mod 60));
      WriteLn('Seconds:'+IntToStr((finishs2-starts2)div 1000 mod 60));
      WriteLn('MiliSeconds:'+IntToStr((finishs2-starts2)mod 1000));
      flag2:=false;
    end;
    //���� ��� �������� �����������, ������� �� �����
    if not((errCode1=STILL_ACTIVE)or(errCode2=STILL_ACTIVE)) then break;
  end;
  //��������� ������ ���������
  WriteLn('Master: exiting');
end.
