'''
CPSC353
Ben Nored and Mathew Hasting
Function that performs fermat's algorithm for factorization.
Run by writing fermat(n) on the command line.
'''

def fermat(n):
  fout = open("fermat_fact.out", 'w')
  fout.write("Factoring: " + str(n)+ '\n')

  #special cases
  if is_prime(n):
    fout.write(str(n) + " is prime")
    fout.close()
    return

  if n.is_square():
    r = sqrt(n)
    fout.write("Perfect Square: " + str(r) + " X " + str(r))
    fout.close()
    return
  
  #Fermat's Algorithm
  k = 1
  while(True):
    rsq = n+k^2
    fout.write(str(k) + " " + str(rsq) + '\n')
    if rsq.is_square():
      r = sqrt(rsq)
      fout.write("Factors: " + str(r+k) + " " + str(r-k))
      fout.close()
      break
    k = k + 1
        
