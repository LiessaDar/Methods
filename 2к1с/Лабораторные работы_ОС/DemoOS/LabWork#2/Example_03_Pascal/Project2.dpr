//---------------------------------------------------------------------------
//���������������� ������ � ������������ ������ �2
//������ ���������
//---------------------------------------------------------------------------
//�������: ������� ���������, ������� ��������� �� ���������� ��� ������
//������ ����� �������� �������� ����������
//������ ����� ������� �������� ���������� �� �����
//---------------------------------------------------------------------------
program Project2;

{$APPTYPE CONSOLE}

//���������� ����������� ����������
uses
  Windows, SysUtils;

var
  //���������� ��� �������� ������� ���������� ���������
  startt, finisht:Cardinal;
  //�������������� �������� ����������
  tmp,i,j:Integer;
  //���������� ��� �������� �������
  ThID : Cardinal;
  hThreadFill:Cardinal;  //������ �����
  hThreadshow:Cardinal;  //������ �����

//��������� ������� ������
procedure fillValue();
var
  i:Integer;
begin
  //�������� �������� ��������� � �����
  for i:=1 to 100 do begin
    tmp:=tmp+1;
    //��������� ����� ���������� ������� ������, ��������� ����� �����
    //������ ��������, ������ ���������� �������� ����������
    sleep(1);
  end;
end;

//��������� ������� ������
procedure showValue();
var
  i:Integer;
begin
  //������� �������� ���������� ������ ���������� ���
  for i:=1 to 100 do begin
    Write(IntToStr(tmp)+' ');
  end;
end;

begin
  { TODO -oUser -cConsole Main : Insert code here }
  //������� ��������� � ������ ���������� ���������
  Write('Process started');
  //�������� ������ ���������� �������
  startt:=gettickcount();
  //��������� ������ �����
  hThreadFill:=CreateThread(nil,0,@fillValue,nil,0,ThID);
  //��������� ������ �����
  hThreadShow:=CreateThread(nil,0,@showValue,nil,0,ThID);
  //������������� ������ ���������� ��� �������
  SetThreadPriority(hThreadFill,THREAD_PRIORITY_HIGHEST	);
  SetThreadPriority(hThreadShow,THREAD_PRIORITY_HIGHEST );
  //������� ��������� ���������� �������
  WaitForSingleObject(hThreadFill,INFINITE);
  WaitForSingleObject(hThreadshow,INFINITE);
  //��������� ������
  CloseHandle(hThreadFill);
  CloseHandle(hThreadshow);
  //��������� �������� �����
  finisht:=gettickcount();
  //������� ��������� ������� ���������� ���������
  WriteLn('Process finished!!!');
  WriteLn('Minutes:'+IntToStr((finisht-startt)div 60000 mod 60));
  WriteLn('Seconds:'+IntToStr((finisht-startt)div 1000 mod 60));
  WriteLn('MiliSeconds:'+IntToStr((finisht-startt)mod 1000));
end.
