# parallelismForAllLang
Parallelism example for all language 用各種程式語言來實現平行處理(並行)

Thread, process, goroutine, isolate, worker...有太多方法可以實現平行處理, 有太多語言需要學習, 您累了嗎?<br/>
反正我是不累, 只要不用自擼GC, 高階語言來再多都坦得住 :)<br/>
我儘量用最簡短的例子來演示parallelism, race, lock的概念, 訊息傳遞使用callback(沒錯!這東西幾乎每種語言都支援)<br/>
lock的策略有很多, 具體還要依實際場景來分析選用, 為了讓程式簡潔一些, 我使用最基本的方式.

把listener裡的lock語句註解掉, 即可觀看race的情形; 取消註解check CPU parallelism即可確認多顆CPU是否都有利用到.<br/>
最後您會發現, Dart和Node.js不需要關心race和lock的問題, 看起來像是瘦身後的multi-process.<br/>
Python和Ruby內建的thread有GIL的問題, 所以用multi-process替代實現.<br/>
然後您會找不到Ruby的sample, 那是因為我找不到可以跨平台的並行方案, 不管是內建還是第三方, 希望有Ruby大神幫忙補完.

如果您愛用的語言不在列表中, 歡迎您補充與提交, 敬強迫症!
