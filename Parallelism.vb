Imports System.Threading

Module Parallelism
    Sub Main()
        Dim threads = 5
        Dim count = 0
        Dim lobj = New Object()
        Dim listener As Action = Function()
                                     SyncLock lobj
                                         count += 1
                                         Thread.Sleep(1000)
                                         Console.WriteLine(count)
                                     End SyncLock
                                 End Function

        For i = 1 To threads
            Dim t = New Thread(AddressOf doit)
            t.Start(listener)
        Next
    End Sub

    Sub doit(cb As Object)
        ' check cpu parallelism
        'While True
        'End While

        Thread.Sleep(1000)
        Dim _cb = CType(cb, Action)
        Console.WriteLine("並行")
        _cb()
    End Sub
End Module
