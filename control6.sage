#Assignment Name: Project 6
#Name 1: Mathew Hasting
#Name 2: Ben Nored
#GitHub Name: MHasting2

import os
os.system('sage --preparse rsa.sage')
os.system('mv rsa.sage.py rsa.py')
import rsa as ciph 

import pickle

def init(args):
    mode = args[1]
    #key_file = open(args[2],'r')
    with open('data.pickle', 'rb') as f:
        key = pickle.load(f)
    fin = open(args[3],'r')
    fout = open(args[4], 'w')
    return mode, key, fin, fout    

def process(args):
    mode, key, fin, fout = init(args)

    data = fin.read().upper()
    n = key[0]
    e = key[1]
    d = key[2]
    
    if (mode == 'enc'):
        ch = ciph.encrypt(data,e,n)
        fout.write(str(ch))
    if (mode == 'dec'):
        ch = ciph.decrypt(int(data),d,n)
        fout.write(str(ch))
        
    fin.close()
    fout.close()

# save
def write_key(file_name):
    print('Enter size of key:')
    size = int(input())
    key = ciph.key_gen(size)
    with open('data.pickle', 'wb') as f:
        pickle.dump(key, f)
'''
usage: python3 caesar_tst.py mode key_file input output
#where:
 mode is enc or dec
 key_file is the name of the file containing the key
 input is the name of the file containing text to be encrypted/decrypted
 output is the name of the file containing the result of the encrypt/decrypt operation 
'''
def main():
    #generate, store key
    if len(sys.argv) == 2:
        write_key(sys.argv[1])
        return

    #encrypt or decrypt
    process(sys.argv)
main()

