//---------------------------------------------------------------------------
//Демонстрационный проэкт к лабораторной работе №2
//ПЕРВАЯ ПРОГРАММА
//---------------------------------------------------------------------------
//ЗАДАНИЕ: создать программу, которая запускает на выполнение поочередно
//несколько раз два потока
//первый поток заполняет массив
//второй поток сортирует массив
//---------------------------------------------------------------------------
program Project1;

{$APPTYPE CONSOLE}

//Подключаем необходимые библиотеки
uses
  Windows, SysUtils;
const
  ARRSIZE    = 10000;//размер массива
  SORTAMOUNT = 100;  //количество сортировок

var
  //переменные для хранения времени выполнения программы
  startt, finisht:Cardinal;
  //массив для сортировки
  arr:Array [1..arrsize] of Integer;
  //дополнительные веменные переменные
  i,j,k,l,max,tmp:Integer;
  //переменные для описания потоков
  ThID : Cardinal;
  hThreadFill:Cardinal;
  hThreadSort:Cardinal;

//процедура первого потока - заполнения массива
procedure fillArray();
begin
  for j:=1 to ARRSIZE do begin
    arr[j]:=random(10000);
  end;
end;

//процедура второго потока - сортировки массива
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

  //выводим сообщение о начале выполнения программы
  Write('Process started');

  //засекаем начало выполнения потоков
  startt:=gettickcount();
  for i:=1 to SORTAMOUNT do begin

    //запускаем первый поток
    hThreadFill:=CreateThread(nil,0,@fillArray,nil,0,ThID);
    //ожидаем его окончания
    WaitForSingleObject(hThreadFill,INFINITE);
    //завершаем работу потока
    CloseHandle(hThreadFill);

    //запускаем второй поток
    hThreadSort:=CreateThread(nil,0,@sortArray,nil,0,ThID);
    //ожидаем его окончания
    WaitForSingleObject(hThreadSort,INFINITE);
    //завершаем работу потока
    CloseHandle(hThreadSort);
    //выводим точку на экран, как признак работы программы
    if (i mod (SORTAMOUNT div 10)=0) then write('.');
  end;
  //фиксируем конечное время
  finisht:=gettickcount;
  //выводим результат времени выполнения программы
  WriteLn('Process finished!!!');
  WriteLn('Minutes:'+IntToStr((finisht-startt)div 60000 mod 60));
  WriteLn('Seconds:'+IntToStr((finisht-startt)div 1000 mod 60));
  WriteLn('MiliSeconds:'+IntToStr((finisht-startt)mod 1000));
end.
