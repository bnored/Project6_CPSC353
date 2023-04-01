#Assignment Name: Project 6
#Name 1: Mathew Hasting
#Name 2: Ben Nored
#GitHub Name: MHasting2

import random

def key_gen(size):

    # Hard-coded e value
    e = 17

    # Generate two random primes between 2^size-1 and 2^(size-1)
    p = random_prime(2^size-1,False,2^(size-1))
    q = random_prime(2^size-1,False,2^(size-1))
    
    n = p*q
    d = inverse_mod(e,(p-1)*(q-1))
    
    	
    # (n,e,d)
    # Private Key = (n,d)
    # Public Key = (n,e)
    
    # Save public key
    fout = open('public_key.txt', 'w')
    fout.write(str((n,e)))
    fout.close
    
    # Save private key
    fout = open('private_key.txt', 'w')
    fout.write(str((n,d)))
    fout.close
    	
    return (p*q),e,inverse_mod(e,(p-1)*(q-1))
    
    

def encrypt(plain_text,e,n):
    return power_mod(txt_to_num(plain_text),e,n)
    

def decrypt(c,d,n):
    return num_to_txt(power_mod(c,d,n))
    

###### Helper Functions ######
    
#Converts a string to a decimal digit sequence
#msg_in is a string
def txt_to_num(msg_in):      
  #transforms string to the indices of each letter in the 8-bit ASCII table
  #ex: "AB" becomes [65,66]
  msg_idx = list(map(ord,msg_in))

  #The integers in the list, since they are ASCII, are in the range 0..255
  #These are treated, collectively, as a base 256 integer, but from left to right
  #rather than right to left
  #This sequence of integers is converted to base 10 
  #ex: [65,66] = 65*256^0 + 66*256^1 = 16961
  num = ZZ(msg_idx,256)
  return num 

#Converts a digit sequence to a string
#num_in is a decimal integer, constructed from a string using txt_to_num 
def num_to_txt(num_in):
  #transforms the base 10 num_in to a list of base 256 digits. 256^0 is on the left 
  msg_idx = num_in.digits(256)

  #maps each index to its associated character in the ascii table 
  m = map(chr,msg_idx)

  #transforms the list to a string
  m = ''.join(m)
  return m

