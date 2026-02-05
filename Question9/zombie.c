#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;
    int i;

    for (i = 0; i < 3; i++) {
        pid = fork();

        if (pid == 0) {
            // Child process
            printf("Child process created. PID = %d\n", getpid());
            sleep(2);
            exit(0);
        }
        else if (pid < 0) {
            perror("Fork failed");
            exit(1);
        }
    }

    // Parent process cleans up children
    for (i = 0; i < 3; i++) {
        pid = wait(NULL);
        printf("Parent cleaned up child with PID = %d\n", pid);
    }

    return 0;
}

