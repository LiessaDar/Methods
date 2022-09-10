//---------------------------------------------------------------------------
//���������������� ������ � ������������ ������ �2
//������ ���������
//---------------------------------------------------------------------------
//�������: ������� ���������, ������� ��������� ������ ���������, ��������� �
//����� �������� �� ��������� ������, ����� ���� ��������� ���� ������,
//������ ��������� ������ ��������� ���������� ������ � ������ ��������� �
//����� ����������
//---------------------------------------------------------------------------
//���������� ����������� ����������
#include <windows.h>
#include <iostream.h>
#include <string.h>

#pragma hdrstop
#pragma argsused

//------������� ������� ���������--------------------------------------------
int main(int argc, char* argv[]) {
  char cmd[128];   //��������� �� ������ ��� ������� ������� ������� ��������
  //��������� ��������� ��������� ������
  if (argc!=1)
    //���� ������ ����� ���� ��������, �� ������ �������� ��������� �� ���
    //������ ���������
    strcpy(cmd, argv[1]);
  else
    //����� �� ��������� ����� ������������ ��� slave.exe
    strcpy(cmd,"slave.exe");
  //�������� ������������� �������� ��������
  int  pid=GetCurrentProcessId();
  //������� ��� �� �����
  sprintf(cmd+strlen(cmd)," %d",pid);
  cout<<"Master pid - "<<pid<<"\n";
  cout<<"Master: starting "<<cmd<<"\n";
  //��������� �������������� ��������� ��� �������� ���������� � �����������
  //��������
  STARTUPINFO info;
  PROCESS_INFORMATION pinfo;
  //�������� ����������� ������ ��� �������������� ��������
  memset(&info, 0 , sizeof(info));
  info.cb=sizeof(info);
  //�������� ��������� ������ �������
  if (!CreateProcess(NULL,
                     cmd, //��������� ������ ������� ������� ��������
                     NULL,
                     NULL,
                     FALSE,
                     NORMAL_PRIORITY_CLASS, //��������� ��������
                     NULL,
                     NULL,
                     &info,
                     &pinfo)) {
    //� ������ ������� ������� ��������� �� ������
    cout<<"Master: Slave was not running!"<<"\n";
    cout<<"Master: Check argument string!"<<"\n";
    //��������� �������� ������ ���������
    return 1;
  }
  //������� �������� � ������������ ������ ���������
  cout<<"Master: sleeping!"<<"\n";
  //������������� ���������� ������ ��������� �� 15 ������
  Sleep(15000);
  //������� ��������� � ���������� ������ ������ ���������
  cout<<"Master: exiting!"<<"\n";
  //��������� ������ ���������
  return 0;
}
//-------����� ������� ������� ���������-------------------------------------

