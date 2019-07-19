#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 21 14:27:18 2018

@author: liujingyi
"""
import os
from bs4 import BeautifulSoup as bs
import requests
import pandas as pd

 #os.chdir("Desktop")
os.getcwd()


def getData(f1):
    with open (f1, "r") as myfile:
        data=myfile.readlines()
    
    for i in data:
        url = i

    r = requests.get(url)
    data = r.text    
    soup = bs(data, "html.parser")
    
    
    allRows = soup.findAll('tr',{'align':'center'})


    tableData = []
    for row in allRows:
        eachRow = []
        cells = row.findAll('td')
        for cell in cells:
            eachRow.append(str(cell.text.strip()))
           
        tableData.append(eachRow)

    labels = tableData.pop(0)
    df = pd.DataFrame.from_records(tableData, columns=labels)
    df['SUBJECT'] = df['SUBJECT'].str.replace("\n","").str.replace("\t","")
    return(df)
    
    
def writeOutput(df, outf):
   df.to_csv(outf)

if __name__ == "__main__":
    import sys
    if len(sys.argv) == 5:
        myString = getData(sys.argv[2])
        writeOutput(myString,sys.argv[4])
    else:
        print ("Invalid number of arguments; you need three arguments")
        

        
