#include <windows.h>
#include <iostream.h>
#include <stdio.h>
//---------------------------------------------------------------------------

#pragma hdrstop

//---------------------------------------------------------------------------

#pragma argsused
const int SORTAMOUNT=100;
const int ARRSIZE   =10000;

int main(int argc, char* argv[]) {
  int startt, finisht;
  int arr[ARRSIZE];

  int i,j,k,l,max,tmp;

  cout<<"Process started";

  startt=GetTickCount();
  for (i=0; i < SORTAMOUNT; i++) {
    for (j=0; j<ARRSIZE; j++) {
      arr[j]=random(10000);
    }

    for (k=0; k<ARRSIZE-1; k++) {
      max=k;
      for (l=k+1; l<ARRSIZE; l++) {
        if (arr[max]<arr[l]) max=l;
      }
      tmp=arr[k];
      arr[k]=arr[max];
      arr[max]=tmp;
    }
    if (i % (SORTAMOUNT / 10)==0) cout<<".";
  }
  finisht=GetTickCount();
  char string[10];

  cout<<"Process finished!!!"<<"\n";
  itoa((finisht-startt)/60000%3600000, string, 10);
  cout<<"Minutes:"<<string<<"\n";
  itoa((finisht-startt)/1000%60000, string, 10);
  cout<<"Seconds:"<<string<<"\n";
  itoa((finisht-startt)%1000, string, 10);
  cout<<"MiliSeconds:"<<string<<"\n";

  return 0;
}
//---------------------------------------------------------------------------
