@ECHO OFF

IF "%1"=="ic" GOTO INCOMMAND
IF "%1"=="oc" GOTO OUTCOMMAND

GOTO EXIT

:INCOMMAND
ECHO ����७��� �������
ECHO ����� � ��⠫�����
ECHO CD, CDDIR - ᬥ�� ��⠫���
ECHO MD, MDDIR - ᮧ����� ��⠫���
ECHO RD, RDDIR - 㤠����� ��⠫���
ECHO DIR       - ��ᬮ�� ᮤ�ন���� ��⠫���
ECHO ����� � 䠩����
ECHO TYPE      - ��ᬮ�� 䠩��
ECHO DEL, ERASE- 㤠����� 䠩��
ECHO REN       - ��७��, ��२��������� 䠩��
ECHO COPY      - ����஢���� 䠩��
ECHO ����� � ��⮩ � �६����
ECHO DATE      - �뢮�, ��������� ⥪�饩 ����
ECHO TIME      - �뢮�, ��������� ⥪�饣� �६���
ECHO ����� �࠭��
ECHO CLS       - ���⪠ �࠭�
ECHO PROMPT    - ��������� �ਣ��襭��

GOTO EXIT

:OUTCOMMAND
ECHO ���譨� �������
ECHO ATTRIB	- ��⠭���� ����⮢ 䠩��
ECHO XCOPY	- ���७��� ������� ����஢����
ECHO SYS	- ��⠭���� MS DOS �� 㪠����� ���
ECHO FORMAT	- �ଠ�஢���� ��᪠
ECHO FDISK      - �⨫�� ࠧ������ ��᪠
ECHO FIND	- ������� ���᪠ � 䠩�� ��᫥����⥫쭮�� ᨬ�����
ECHO MORE	- �ணࠬ�� ����࠭�筮�� �뢮�� ���ଠ樨
ECHO MOVE       - ���७��� ������� ��६�饭�� 䠩��� � ��⠫����
ECHO SORT	- ���஢�� ������
ECHO CHOICE	- �࣠������ ������� � ���짮��⥫��

GOTO EXIT

:RUN
example_01.bat %1

:EXIT
IF "%2"=="R" GOTO :RUN


