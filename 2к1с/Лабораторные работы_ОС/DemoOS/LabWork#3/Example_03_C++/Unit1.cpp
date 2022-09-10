//---------------------------------------------------------------------------
//���������������� ������ � ������������ ������ �3
//---------------------------------------------------------------------------
//�������: ������� ���������, ������� ���������� ������� ����� ���������
//��������� ������� (���������� ���� ��������� ������� �������� 0),
//���������� ������� �������
//����� ������� �� �����
//������������������ ������ ����������� ������, �������� ����� ��������
//����� ��������� ��������� �������
//---------------------------------------------------------------------------
//���������� ����������� ����������
#include "windows.h"
#include "iostream.h"
#include "process.h" //��� ������������� ������� _beginthread � _endthread()
//���������� ��������� � �������
#define MAX_ARRAY 5
//���������� ��� �������� ����������� ������
CRITICAL_SECTION critsect;
//������ ��� ���������
int array[MAX_ARRAY];
//������� ��� �������
void EmptyArray(void *);//������� �������
void PrintArray(void *);//������ ������� �� �����
void FullArray(void *); //���������� �������

void main() {
  //�������������� ���������� ��� ���������� ������������ ��������
  InitializeCriticalSection(&critsect);
  //��������� ������ � ������� _beginthread
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

void EmptyArray(void *) { //��������� �������
  cout << "EmptyArray" << endl;
  EnterCriticalSection(&critsect);
  for (int x=0;x<(MAX_ARRAY+1); x++) array[x]=0;
  Sleep(1000);
  LeaveCriticalSection(&critsect);
  _endthread();
}

void PrintArray(void *) { //����� ������� �� �����
  cout << "PrintArray" << endl;
  EnterCriticalSection(&critsect);
  for (int x=0;x<(MAX_ARRAY+1); x++) cout << array[x] << " ";
  cout << endl;
  Sleep(1000);
  LeaveCriticalSection(&critsect);
  _endthread();
}

void FullArray(void *) { //���������� ������� �������
  cout << "FullArray" << endl;
  EnterCriticalSection(&critsect);
  for (int x=0;x<(MAX_ARRAY+1); x++) array[x]=x;
  Sleep(1000);
  LeaveCriticalSection(&critsect);
  _endthread();
}
