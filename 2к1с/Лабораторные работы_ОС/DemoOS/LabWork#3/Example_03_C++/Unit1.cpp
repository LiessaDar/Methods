//---------------------------------------------------------------------------
//Демонстрационный проэкт к лабораторной работе №3
//---------------------------------------------------------------------------
//ЗАДАНИЕ: создать программу, которая вотдельных потоках может выполнять
//обнуление массива (присвоение всем элементам массива значений 0),
//заполнение массива числами
//вывод массива на экран
//продемонстрировать работу критических секций, которыми будут являться
//циклы обработки элементов массива
//---------------------------------------------------------------------------
//Подключаем необходимые библиотеки
#include "windows.h"
#include "iostream.h"
#include "process.h" //для использования функций _beginthread и _endthread()
//количество элементов в массиве
#define MAX_ARRAY 5
//переменная для хранения критической секции
CRITICAL_SECTION critsect;
//массив для обработки
int array[MAX_ARRAY];
//функции для потоков
void EmptyArray(void *);//очистки массива
void PrintArray(void *);//вывода массива на экран
void FullArray(void *); //заполнения массива

void main() {
  //инициализируем переменную для управления критическими секциями
  InitializeCriticalSection(&critsect);
  //запускаем потоки с помощью _beginthread
  if (_beginthread(EmptyArray,1024,NULL)==(unsigned long)-1)
  	cout << "Error begin thread " << endl;
  if (_beginthread(PrintArray,1024,NULL)==(unsigned long)-1)
  	cout << "Error begin thread " << endl;
  if (_beginthread(FullArray,1024,NULL)==(unsigned long)-1)
  	cout << "Error begin thread " << endl;
  if (_beginthread(PrintArray,1024,NULL)==(unsigned long)-1)
  	cout << "Error begin thread " << endl;
  if (_beginthread(EmptyArray,1024,NULL)==(unsigned long)-1)
  	cout << "Error begin thread " << endl;
  if (_beginthread(PrintArray,1024,NULL)==(unsigned long)-1)
  	cout << "Error begin thread " << endl;
  Sleep(10000);
}

void EmptyArray(void *) { //обнуление массива
  cout << "EmptyArray" << endl;
  EnterCriticalSection(&critsect);
  for (int x=0;x<(MAX_ARRAY+1); x++) array[x]=0;
  Sleep(1000);
  LeaveCriticalSection(&critsect);
  _endthread();
}

void PrintArray(void *) { //вывод массива на экран
  cout << "PrintArray" << endl;
  EnterCriticalSection(&critsect);
  for (int x=0;x<(MAX_ARRAY+1); x++) cout << array[x] << " ";
  cout << endl;
  Sleep(1000);
  LeaveCriticalSection(&critsect);
  _endthread();
}

void FullArray(void *) { //заполнение массива числами
  cout << "FullArray" << endl;
  EnterCriticalSection(&critsect);
  for (int x=0;x<(MAX_ARRAY+1); x++) array[x]=x;
  Sleep(1000);
  LeaveCriticalSection(&critsect);
  _endthread();
}
