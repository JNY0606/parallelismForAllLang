#include <stdio.h>
#include <windows.h>
#include <malloc.h>


HANDLE lobj = NULL;
int count = 0;
int threads = 5;

 void doit(void cb()) {
	 /* check CPU parallelism
	 while(TRUE){}
	 //*/

	Sleep(1000);
	printf("%s\n", "並行");
	cb();
}

 void listener() {
	 WaitForSingleObject(lobj, INFINITE);

	 ++count;
	 Sleep(1000);
	 printf("%d\n", count);

	 ReleaseMutex(lobj);
 }


int main()
{
	lobj = CreateMutex(NULL, FALSE, NULL);

	for (auto i = 0; i < threads; ++i) {
		CreateThread(NULL, 0, doit, listener, 0, NULL);
	}
	
	while (threads != count) Sleep(1000);
}

