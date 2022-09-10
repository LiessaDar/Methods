//---------------------------------------------------------------------------
//���������������� ������ � ������������ ������ �2
//������ ���������
//---------------------------------------------------------------------------
//�������: ������� ���������, ������� ��������� �� ���������� ����������
//��������� ��� ��� ������
//������ ����� ��������� ������
//������ ����� ��������� ������
//---------------------------------------------------------------------------
program Project1;

{$APPTYPE CONSOLE}

//���������� ����������� ����������
uses
  Windows, SysUtils;
const
  ARRSIZE    = 10000;//������ �������
  SORTAMOUNT = 100;  //���������� ����������

var
  //���������� ��� �������� ������� ���������� ���������
  startt, finisht:Cardinal;
  //������ ��� ����������
  arr:Array [1..arrsize] of Integer;
  //�������������� �������� ����������
  i,j,k,l,max,tmp:Integer;
  //���������� ��� �������� �������
  ThID : Cardinal;
  hThreadFill:Cardinal;
  hThreadSort:Cardinal;

//��������� ������� ������ - ���������� �������
procedure fillArray();
begin
  for j:=1 to ARRSIZE do begin
    arr[j]:=random(10000);
  end;
end;

//��������� ������� ������ - ���������� �������
procedure sortArray();
begin
  for k:=1 to ARRSIZE-1 do begin
    max:=k;
    for l:=k+1 to ARRSIZE do begin
      if arr[max]<arr[l] then max:=l;
    end;
    tmp:=arr[k];
    arr[k]:=arr[max];
    arr[max]:=tmp;
  end;
end;

begin
  { TODO -oUser -cConsole Main : Insert code here }

  //������� ��������� � ������ ���������� ���������
  Write('Process started');

  //�������� ������ ���������� �������
  startt:=gettickcount();
  for i:=1 to SORTAMOUNT do begin

    //��������� ������ �����
    hThreadFill:=CreateThread(nil,0,@fillArray,nil,0,ThID);
    //������� ��� ���������
    WaitForSingleObject(hThreadFill,INFINITE);
    //��������� ������ ������
    CloseHandle(hThreadFill);

    //��������� ������ �����
    hThreadSort:=CreateThread(nil,0,@sortArray,nil,0,ThID);
    //������� ��� ���������
    WaitForSingleObject(hThreadSort,INFINITE);
    //��������� ������ ������
    CloseHandle(hThreadSort);
    //������� ����� �� �����, ��� ������� ������ ���������
    if (i mod (SORTAMOUNT div 10)=0) then write('.');
  end;
  //��������� �������� �����
  finisht:=gettickcount;
  //������� ��������� ������� ���������� ���������
  WriteLn('Process finished!!!');
  WriteLn('Minutes:'+IntToStr((finisht-startt)div 60000 mod 60));
  WriteLn('Seconds:'+IntToStr((finisht-startt)div 1000 mod 60));
  WriteLn('MiliSeconds:'+IntToStr((finisht-startt)mod 1000));
end.
