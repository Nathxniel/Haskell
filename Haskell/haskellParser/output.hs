MdleStat "Sequences where \n \n"
ImprtStat "Data.Char (ord, chr) \n \n \n"
SLineC " Returns first argument if it is larger than the second,"
SLineC " returns the second argument otherwise"
FuncDef "maxOf2::Int->Int->Int\n\tmaxOf2xy\n"
SLineC " people should'nt comment like this tbf"
Pattern (FStat (["|","x",">=","y"],["=","x","\n","\t","|","otherwise","=","y","\n","\t","\n"]),[])
SLineC " Returns the largest of three Ints"
FuncDef "maxOf3::Int->Int->Int->Int\n\tmaxOf3xyz\n\t=maxOf2(maxOf2xy)z\n"
MLineC " bad \n bitches on me i guess money was the only thing missing \n (hold on hold on wait) \n"
SLineC " Without using the previous function"
MLineC " \n \t | x >= y && x >= z = x \n \t | y >= z = y \n \t | otherwise = z \n"
SLineC " Returns True if the character represents a digit '0'..'9';"
SLineC " False otherwise"
FuncDef "isADigit::Char->Bool\n\tisADigitc\n\t=ordc>=ord'0'&&ordc<=ord'9'\n\t\n"
SLineC " Returns True if the character represents an alphabetic"
SLineC " character either in the range 'a'..'z' or in the range 'A'..'Z';"
FuncDef "isAlpha::Char->Bool\n\tisAlphac\n\t=(ordc>=ord'a'&&ordc<=ord'z')||\n\t(ordc>=ord'A'&&ordc<=ord'Z')\n\t\n"
SLineC " Returns the integer [0..9] corresponding to the given character."
SLineC " Note: this is a simpler version of digitToInt in module Data.Char,"
SLineC " which does not assume the precondition"
FuncDef "digitToInt::Char->Int\n"
SLineC " Pre: the character is one of '0'..'9'"
Pattern (FStat (["digitToInt","c","\n","\t","|","ord","c",">=","48","&&","ord","c","<=","57"],["=","ord","(c)","-","ord","'0'","\n","\t","|","otherwise","=","error","\"Cannot","convert","character","to","Int\"","\n","\t","\n"]),[])
SLineC " Returns the upper case character corresponding to the input."
SLineC " Uses guards by way of variety."
FuncDef "toUpper::Char->Char\n"
SLineC " Pre: the input character can be capitalised"
Pattern (FStat (["toUpper","c","\n","\t","|","ord","c",">=","97","&&","ord","c","<=","122"],["=","chr","(ord","c","-","(ord","'a'","-","ord","'A'))","\n","\t","|","ord","c",">=","65","&&","ord","c","<=","90","=","c","\n","\t","\n"]),[])
SLineC ""
SLineC " Sequences and series"
SLineC ""
SLineC " Arithmetic sequence"
FuncDef "arithmeticSeq::Double->Double->Int->Double\n\tarithmeticSeqadn\n\t=a+d*n'\n\twhere\n\tn'=fromIntegraln\n\t\n\t\n"
SLineC " Geometric sequence"
FuncDef "geometricSeq::Double->Double->Int->Double\n\tgeometricSeqarn\n\t=a*r^n'\n\twhere\n\tn'=fromIntegraln\n\t\n"
SLineC " Arithmetic series"
FuncDef "arithmeticSeries::Double->Double->Int->Double\n\tarithmeticSeriesadn\n\t=(n'+1)*(a+(d*n')/2)\n\t\n"
SLineC " where clause"
Pattern (FStat (["where","\n","\t","n'"],["=","fromIntegral","n","\n","\t","doNothing","::","String","->","String","\n","\t","doNothing","\n","\t","=","undefined","\n","\t","\n"]),[])
SLineC " Geometric series"
FuncDef "geometricSeries::Double\n\t->Double\n\t->Int\n\t->Double\n\tgeometricSeriesarn\n\t|r==1.00=a*(fromIntegraln+1)\n\t|otherwise=a*(1-r^(fromIntegraln+1))/(1-r)\n\t\n\ttestFunction\n\t=id\n"
