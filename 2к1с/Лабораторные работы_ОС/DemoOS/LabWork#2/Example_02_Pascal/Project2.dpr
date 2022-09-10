//---------------------------------------------------------------------------
//Демонстрационный проэкт к лабораторной работе №2
//ВТОРАЯ ПРОГРАММА
//---------------------------------------------------------------------------
//ЗАДАНИЕ: создать программу, которая запускает на выполнение два других
//процесса, в которых выполняется несколько заполнение и последующих
//сортировок массива
//---------------------------------------------------------------------------
program Project2;

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
begin
  { TODO -oUser -cConsole Main : Insert code here }
  //выводим сообщение о начале выполнения программы
  Write('Process started');
  //засекаем начало выполнения потоков
  startt:=gettickcount();
  //в цикле выполняем нужное количество заполнений и сортировок
  for i:=1 to SORTAMOUNT do begin
    //заполняем массив
    for j:=1 to ARRSIZE do begin
      arr[j]:=random(10000);
    end;
    //сортируем массив
    for k:=1 to ARRSIZE-1 do begin
      max:=k;
      for l:=k+1 to ARRSIZE do begin
        if arr[max]<arr[l] then max:=l;
      end;
      tmp:=arr[k];
      arr[k]:=arr[max];
      arr[max]:=tmp;
    end;
    //выводим точку как признак работы процесса
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
