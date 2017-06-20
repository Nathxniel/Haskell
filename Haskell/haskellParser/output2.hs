ImprtStat "System.IO (readFile, writeFile) \n"
ImprtStat "System.Environment (getArgs) \n"
ImprtStat "Control.Monad \n"
ImprtStat "Control.Applicative \n"
ImprtStat "Data.Char \n \n"
TypeStat "Parser = [String] -> [String] \n \n"
SLineC " File IO version main"
Func ([FStat (["main","::","IO","()","\n","main"],["=","do","\n"])],[])
SLineC " get read and write location from program arguments"
Func ([FStat (["[readfile,","writefile]","<-","getArgs","\n"],[])],[])
SLineC " remove extraneous spaces"
Func ([FStat (["ls","<-","map","(unwords",".","words)",".","lines","<$>","readFile","readfile","\n"],[])],[])
SLineC " write output to file"
Func ([FStat (["writeFile","writefile","(unlines",".","parse","$","ls)","\n","\n"],[])],[])
SLineC " Terminal version main"
SLineC "main :: IO ()"
SLineC "main = do"
SLineC " ls <- lines <$> getContents"
SLineC " putStrLn . unlines . parse $ ls"
MLineC " the parser"
Func ([FStat (["parse","::","Parser","\n"],[])],[])
SLineC " parsing single-line comments"
Func ([FStat (["parse","(('{':'-':s):ss)","\n"],["=","comment","(s:ss)","\n","\n"]),FStat (["parse","(('-':'-':s):ss)","\n"],["=","('-':'-':'","':s)",":","parse","ss"])],[])
SLineC "empty lines and spaces"
Func ([FStat (["parse","a@(('","':_):_)","\n"],["=","space","a","\n","\n"]),FStat (["parse","(\"\":ss)","\n"],["=","parse","ss"])],[])
SLineC "function definitions"
Func ([FStat (["parse","[]","\n"],["=","[]","\n","\n"]),FStat (["parse","(s:ss)","\n","|","isFuncDef","s"],["=","s",":","processFunction","ss","\n","|","otherwise","=","parse","ss"])],[])
SLineC " helper functions for specific parses"
SLineC " strip spaces"
Func ([FStat (["strip","(c:cs)","\n"],["=","c",":","strip","cs","\n","\n"]),FStat (["strip","('","':cs)","\n"],["=","strip","cs"]),FStat (["strip","::","String","->","String","\n","strip","[]","\n"],["=","[]"])],[])
SLineC " multi-line comments"
Func ([FStat (["comment","(s:ss)","\n","|","ended"],["=","rest",":","parse","(after:ss)","\n","|","otherwise","=","('-':'-':'","':s)",":","comment","ss","\n","where","\n","isCommentEnd","('-':'}':xs)","before","\n","=","(True,","('-':'-':'","':(reverse","before)),","xs)","\n","isCommentEnd","(x:xs)","before","\n","=","(e","||","False,","b,","a)","\n","where","\n","(e,","b,","a)","=","isCommentEnd","xs","(x:before)","\n","isCommentEnd","[]","before","\n","=","(False,","before,","[])","\n","(ended,","rest,","after)","=","isCommentEnd","s","[]","\n","\n","\n","\n"]),FStat (["comment","(('-':'}':s):ss)","\n"],["=","('-':'-':'","':s)",":","parse","ss"]),FStat (["comment","((\"-}\"):ss)","\n"],["=","parse","ss"]),FStat (["comment","::","Parser","\n","comment","([]:ss)","\n"],["=","comment","ss"])],[])
SLineC " comment ((x:xs):ss)"
SLineC " = comment (xs:ss)"
SLineC " comment ([]:ss)"
SLineC " = comment ss"
SLineC " empty space"
Func ([FStat (["space","::","Parser","\n","space","(('","':s):ss)","\n"],["=","parse","(s:ss)","\n","\n","processFunction","::","Parser","\n","processFunction","ss","\n","=","pfunc","ss","[]","\n","\n","pfunc","[]","_","\n","=","[]","\n","pfunc","([]:[]:prgm)","function","\n","=","pfunc","prgm","function","\n","pfunc","(('-':'-':s):ss)","function","\n","=","('-':'-':'","':s)",":","pfunc","ss","function","\n","pfunc","(('{':'-':s):ss)","_","\n","=","comment","(s:ss)","\n","pfunc","[p]","function","\n","=","(processWhere","(reverse","function))","++","(parse","[p])","\n","pfunc","(p:q:prgm)","function","\n","|","isFuncDef","q","=","(processWhere","(reverse","(p:function)))","++","(parse","prgm)","\n","|","otherwise","=","pfunc","prgm","(q:p:function)","\n","\n","processWhere","(\"\":func)","\n","=","processWhere","func","\n","processWhere","func","\n","|","hasWhere","func","=","pwhere","func","[]","\n","|","otherwise","=","func","\n","\n","hasWhere","[]","\n","=","False","\n","hasWhere","(f:func)","\n","|","strip","f","==","\"where\"","=","True","\n","|","otherwise","=","hasWhere","func","\n","\n","pwhere","func","[]","\n","=","\"YO\":func","\n","\n"])],[])
SLineC " pwhere (f:func) fn"
SLineC " | strip f == \"where\" = mend (reverse fn) (makeWhereMap func)"
SLineC " | otherwise = pwhere func (f:fn)"
SLineC "mend function wheremap"
SLineC " = concatMap (\\f -> concat . (replace wheremap) $ (words f)) function"
SLineC " where"
SLineC " replace wheremap tokens"
SLineC " function definitions"
Func ([FStat (["isFuncDef","[]","\n"],["=","False","\n"]),FStat (["isFuncDef","(x:xs)","\n"],["=","isFuncDef","xs"]),FStat (["isFuncDef","::","String","->","Bool","\n","isFuncDef","(':':':':_)","\n"],["=","True"])],[])
