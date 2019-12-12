#include <iostream>
#include <Windows.h>
#include <thread>
#include <functional>
#include <mutex>

using namespace std;


typedef function<void()> Callback;
void doit(Callback* cb) {
	/* check cpu parallelism
	while (true){}
	//*/

	Sleep(1000);
	cout << "並行" << endl;
	(*cb)();
}


int main()
{	
	auto threads = 5;
	int count = 0;
	auto mtx = new mutex();

	auto listener = new Callback([&]() {
		mtx->lock();

		++count;
		Sleep(1000);
		cout << count << endl;

		mtx->unlock();
	});
	
	for (auto i = 0; i < threads;++i) {
		auto t = new thread(doit, listener);
	}

	while (threads != count) Sleep(4000);
}

