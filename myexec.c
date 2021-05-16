
#define _GNU_SOURCE
#include <stdio.h>
#include <dlfcn.h>
#include <sys/stat.h>
#include <pwd.h>
#include "sds_ver.h"

typedef int (*orig_execve)(const char *file, char *const argv[], char *const envp[]);

int execve(const char *filename, char *const argv[], char *const envp[])
{
    FILE *fp;
    struct stat buff;
    printf("\n%s\n", filename);

    if ((fp=fopen(filename, "rb"))==NULL)
    {
        printf("Unable to open file\n");
    }
    else
    {
        stat(filename, &buff);
        struct  passwd *pw = getpwuid(buff.st_uid);
        printf("uid: %s\n", pw->pw_name);
        if (pw->pw_uid != 0)
        {
            int result = Verifier(filename);
            if (result == -1)
            {
                char answer;
                while (answer != 'Y' && answer != 'y' && answer != 'N' && answer != 'n')
                {
                    printf("Are you sure you want to launch this application? Y/n ");
                    scanf("%c", &answer);
                    if (answer == 'N' || answer == 'n')
                        return NULL;
                }

            }
        }
    }
    return ((orig_execve)dlsym(RTLD_NEXT, "execve"))(filename, argv, envp);
}