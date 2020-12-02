file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/compare1.txt", "w")

TestString := "This is a test string.`r`n"  ; When writing a file this way, use `r`n rather than `n to start a new line.
file.Write(TestString)
file.Close()