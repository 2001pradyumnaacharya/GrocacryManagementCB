#include "loginCustomHeader.h"
__declspec(dllexport) void dataBaseBuild() {
    int bufferSize = 500;
    loginFileRead = fopen("UserInfo.txt", "r");
    if (loginFileRead == NULL) {
        printf("Failed to open file.\n");
        return;
    }

    sizeOfArray = 0;
    indexArray = 0;
    datacount.userName = (char*)malloc(bufferSize * sizeof(char));
    datacount.password = (char*)malloc(bufferSize * sizeof(char));

    while (fscanf(loginFileRead, "%s %s", datacount.userName, datacount.password) != EOF) {
        sizeOfArray++;
    }

    userCredentials = (struct credentials*)malloc(sizeOfArray * sizeof(struct credentials));
    
    rewind(loginFileRead);

    while (fscanf(loginFileRead, "%s %s", datacount.userName, datacount.password) != EOF) {
        userCredentials[indexArray].userName = strdup(datacount.userName);
        userCredentials[indexArray].password = strdup(datacount.password);
        indexArray++;
    }

    free(datacount.userName);
    free(datacount.password);

    fclose(loginFileRead);
}


__declspec(dllexport) int checkLogin(const char *username, const char *password) {
    int bufferSize = 500;
    int found = 0;

    for (int i = 0; i < sizeOfArray; i++) {
        if (strcmp(userCredentials[i].userName, username) == 0 && strcmp(userCredentials[i].password, password) == 0) {
            printf("Logged in successfully\n");
            found = 1;
            return 1;
        } else if (strcmp(userCredentials[i].userName, username) == 0 && strcmp(userCredentials[i].password, password) != 0) {
            printf("Password is incorrect, please re-enter\n");
            found = 1;
            return 0;
        } else if (strcmp(userCredentials[i].userName, username) != 0 && strcmp(userCredentials[i].password, password) == 0) {
            printf("Username is incorrect, please re-enter\n");
            found = 1;
            return 0;
        }
    }

    if (found==0) {
        printf("User doesn't exist, please register\n");
    }


    return 0;
}


__declspec(dllexport) int checkRegistration(const char *registerEnterName, const char *registerEnterPassword, const char *registerEnterConfirmPassword) {
    // printf("%s %s %s\n", registerEnterName, registerEnterPassword, registerEnterConfirmPassword);
    int instructions = 0;
    int bufferSize = 500;
    FILE *registerWrite;

    registerWrite = fopen("UserInfo.txt", "a");
    if (registerWrite == NULL) {
        printf("Failed to open file.\n");
        return 0;
    }

   
    for (int i = 0; i < sizeOfArray; i++) {
        if (strcmp(userCredentials[i].userName, registerEnterName) == 0 && strcmp(userCredentials[i].password, registerEnterPassword) == 0) {
            printf("User Already Exists. Please Login.\n");
            fclose(registerWrite);
            return 0;
        }
    }

   
    fprintf(registerWrite, "%s %s\n", registerEnterName, registerEnterPassword);

    
    userCredentials[indexArray].userName = strdup(registerEnterName);
    userCredentials[indexArray].password = strdup(registerEnterPassword);

    printf("Registered successfully. Kindly Login.\n");


    fclose(registerWrite);

    return 1;  
}
