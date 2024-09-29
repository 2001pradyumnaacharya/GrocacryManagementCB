import ctypes
from enum import Enum
import os
import sys
class choices(Enum):
   LOGIN=1
   REGISTER=2

path="D:/GroceryMadeEasy/dllSubDirectory"+"/dynaimc.dll"

if not os.path.exists(path):
    print("Authontication Module Does't exists")
    sys.exit()
else:
    loginModule=ctypes.CDLL(path)

loginModule.checkLogin.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
loginModule.checkLogin.restype = ctypes.c_int

loginModule.checkRegistration.argtypes = [ctypes.c_char_p, ctypes.c_char_p, ctypes.c_char_p]
loginModule.checkRegistration.restype = ctypes.c_int

def loginManagement():
 while True:
    try:
        choice = int(input("1: login\n2: register\nEnter your choice: "))

        if choice == choices.LOGIN.value:
          username=input("enter the username: ")
          password=input("Enter the password: ")
          if login(username, password):
             return True
          break
        
        elif choice == choices.REGISTER.value:
          while True:
            username=input("enter the username: ")
            password=input("Enter the password: ")
            conformPassword=input("Enter the conformPassword: ")
            if password!=conformPassword:
               print("Conform password is incorrect kindly re-enter")
               continue
            if register(username,password,conformPassword):
               loginManagement()
               return True
            
        else:
            print("Invalid choice. Please enter either 1 or 2.")
            continue
        
    except ValueError:
        print("The input should be in integer")
        continue
    
    except Exception:
        print("invalid Input")
        continue




def login(username, password):
     loginModule.dataBaseBuild()
     loginModule.checkLogin.argtypes = [ctypes.c_char_p, ctypes.c_char_p]
     loginModule.checkLogin.restype = ctypes.c_int
     userName= username.encode('utf-8')
     passWord= password.encode('utf-8')

     loginResult = loginModule.checkLogin(userName, passWord)
     return loginResult



def register(username,password,conformPassword):
     loginModule.dataBaseBuild()
     loginModule.checkRegistration.argtypes = [ctypes.c_char_p, ctypes.c_char_p, ctypes.c_char_p]
     loginModule.checkRegistration.restype = ctypes.c_int
     registerUserName= username.encode('utf-8')
     registerPassWord= password.encode('utf-8')
     registerConformPassowd=conformPassword.encode('utf-8')

     registerResult = loginModule.checkRegistration(registerUserName, registerPassWord,registerConformPassowd)
     return registerResult
