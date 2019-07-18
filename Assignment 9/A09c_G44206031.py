#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Nov  3 19:50:46 2018

@author: liujingyi
"""

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Nov  2 20:34:14 2018

@author: liujingyi
"""

def getData(f1, f2):
    with open(f1) as f:
        s1 = f.read()    
    with open(f2) as f:
        s2 = f.read()
    s = s1 + s2
    return s

def writeOutput(s,outf):
    import os
    if os.path.exists(outf):
        os.remove(outf)
        
    s = s.lower()
    l = s.split()
    line = []
    str = ''
    for i in range(len(l)):
        c = str.join(filter(lambda x: x in 'abcdefghijklmnopqrstuvwxyz\' ',l[i]))
        if c != '':
            line.append(c)
    
    import numpy as np
    output = np.unique(line)
    
    for i in output:
        s = '{:>15s} {:5d}\n'.format(i,line.count(i))
        
    
        with open (outf, 'a') as f:
            f.write (s)
            
if __name__ == "__main__":
    import os, sys
    if len(sys.argv) == 4:
        myString = getData(sys.argv[1], sys.argv[2])
        #myDict = countChars(myString)
        writeOutput(myString, sys.argv[3])
        os.system('TextEdit ' + sys.argv[3]) 
    else:
        print ("Invalid number of arguments; you need three arguments")