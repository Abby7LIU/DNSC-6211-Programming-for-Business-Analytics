#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Nov  2 19:34:39 2018

@author: liujingyi
"""

def getData(f1, f2):
    with open(f1) as f:
        s1 = f.read()    
    with open(f2) as f:
        s2 = f.read()
    s = s1 + s2
    return s


def writeOutput(s, outf):
    import os

    if os.path.exists(outf):
        os.remove(outf)
        
    count =[]
    letter = ['a', 'b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    s = s.lower()
    
    import pandas as pd
    for i in letter:
        count.append(s.count(i))
    
    dic = {'letter':letter, 'count':count}
    df=pd.DataFrame(dic)
    df = df.sort_values('count',ascending=False)
    letter = list(df.head(10)['letter'])

    
    for i in letter:
        s1 = i
        s2 = '{0:5d}\n'.format(s.count(i))
        
    
        with open (outf, 'a') as f:
            f.write (s1)
            f.write (s2)
            
    
if __name__ == "__main__":
    import os, sys
    if len(sys.argv) == 4:
        myString = getData(sys.argv[1], sys.argv[2])
        #myDict = countChars(myString)
        writeOutput(myString, sys.argv[3])
        os.system('TextEdit ' + sys.argv[3]) 
    else:
        print ("Invalid number of arguments; you need three arguments")
        