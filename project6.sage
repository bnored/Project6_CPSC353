#Assignment Name: Project 
#Name 1: Mathew Hasting
#Name 2: Ben Nored
#GitHub Name: MHasting2

import random
from datetime import datetime
import pickle

def key_gen(size):

    # Generate two random primes between 2^size-1 and 2^(size-1)
    size = int(size)
    n = random_prime(2^size-1,False,2^(size-1))
    d = random_prime(2^size-1,False,2^(size-1))
    
    #print(n)
    #print()
    #print(d)
    	
    return (n,17,d)
    
    # One-liner version of above for after testing
    # return (random_prime(2^int(size)-1,False,2^(int(size)-1)),17,random_prime(2^int(size)-1,False,2^(int(size)-1)))
    

def encrypt(plain_text,e,n):
    

def decrypt(ch,key):
    return key[1]*(ch - key[2])%25

