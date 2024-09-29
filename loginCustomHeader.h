#ifndef LOGIN_CUSTOM_HEADER_H
#define LOGIN_CUSTOM_HEADER_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Structure to store user credentials
struct credentials {
    char *userName;
    char *password;
};

// Global variables
FILE *loginFileRead;
int sizeOfArray;
int indexArray;
struct credentials *userCredentials;
struct {
    char *userName;
    char *password;
} datacount;

// Function to build the database of user credentials
void dataBaseBuild(void);

// Function to check user login credentials
int checkLogin(const char *username, const char *password);

// Function to check and register new user credentials
int checkRegistration(const char *registerEnterName, const char *registerEnterPassword, const char *registerEnterConfirmPassword);

#endif // LOGIN_CUSTOM_HEADER_H
