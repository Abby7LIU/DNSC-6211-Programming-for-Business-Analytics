#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Nov  3 21:03:51 2018

@author: diaoqianying
File name: A09e_G43856749.py
Usage:
python A09e_G43856749.py script01.txt script02.txt sampleout.txt 
Assumptions: The files script01.txt and script02.txt exist
"""

def getData1(f1):
    with open(f1) as f: 
        s1 = f.read()
    return s1

def getData2(f2):
    with open(f2) as f: 
        s2 = f.read()
    return s2
    

#getData("Desktop/assignment/script01.txt", "Desktop/assignment/script02.txt")
def writeOutput(s1,s2,outf):
    import os

    if os.path.exists(outf):
        os.remove(outf) 
    import os
    f3 = os.path.join(os.getcwd(),'stopwords.csv')
    with open(f3) as sw:
        st = sw.read().replace('\r',' ').replace('\n',' ')
        st_sp = st.split()
        
    
    letter = ['a', 'b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    
    s1 = s1.lower()
    l = s1.split()
    line = []
    str = ''
    for i in range(len(l)):
        c = str.join(filter(lambda x: x in "abcdefghijklmnopqrstuvwxyz\'\-" ,l[i]))
        if c != '':
            line.append(c)

            
    s2 = s2.lower()
    l2 = s2.split()
    line2 = []
    str = ''
    for i in range(len(l2)):
        c = str.join(filter(lambda x: x in "abcdefghijklmnopqrstuvwxyz\'\-" ,l2[i]))
        if c != '':
            line2.append(c)
  
    l2 = [s.split(' ') for s in line]
    line1_ = []
    str = ''
    for n in range(len(l2)):
        p = str.join(filter(lambda x: x not in st_sp ,l2[n]))
        if p != '':
            line1_.append(p)
            
    line1 = []
    for x in line1_:
        if x not in letter:
            line1.append(x)
    
    import numpy as np
    output = np.unique(line1)
    
    import pandas as pd
    count = []
    for i in output:
        count.append(line1.count(i))
    
    dic = {'output':output, 'count':count}
    df=pd.DataFrame(dic)
    df = df.sort_values('count',ascending=False)
    output = list(df.head(10)['output'])
    
    head = '{:>7s} {:>10s}{:>10s}\n'.format('WORD','Count 1','Count 2')
    split = '------------------------------\n'
    h = head + split
    
    with open (outf, 'a') as f:
            f.write (h)
    
    for i in output:
        s = '{:>7s} {:10d}{:10d}\n'.format(i,line1.count(i),line2.count(i))
        
    
        with open (outf, 'a') as f:
            f.write (s)

if __name__ == "__main__":
    import os, sys
    if len(sys.argv) == 4:
        myString1 = getData1(sys.argv[1])
        myString2 = getData2(sys.argv[2])
        writeOutput(myString1,myString2, sys.argv[3])
        os.system('TextEdit ' + sys.argv[3]) # for Macs
    else:
        print ("Invalid number of arguments; you need three arguments")
        
        

    
      

