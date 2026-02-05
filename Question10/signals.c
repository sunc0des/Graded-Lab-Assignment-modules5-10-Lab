#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

void handle_sigterm(int sig) {
    printf("Parent received SIGTERM. Exiting gracefully.\n");
    exit(0);
}

void handle_sigint(int sig) {
    printf("Parent received SIGINT. Performing cleanup and exiting.\n");
    exit(0);
}

int main() {
    pid_t pid1, pid2;

    // Register signal handlers
    signal(SIGTERM, handle_sigterm);
    signal(SIGINT, handle_sigint);

    pid1 = fork();

    if (pid1 == 0) {
        // First child sends SIGTERM after 5 seconds
        sleep(5);
        kill(getppid(), SIGTERM);
        exit(0);
    }

    pid2 = fork();

    if (pid2 == 0) {
        // Second child sends SIGINT after 10 seconds
        sleep(10);
        kill(getppid(), SIGINT);
        exit(0);
    }

    // Parent runs indefinitely
    while (1) {
        pause();
    }

    return 0;
}

