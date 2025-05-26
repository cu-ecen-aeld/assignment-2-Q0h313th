#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <syslog.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        syslog(LOG_ERR, "usage is as follows: ./writer <writefile> <writestring>\n");
        exit(1);
    }
    syslog(LOG_DEBUG, "Writing %s to %s\n", argv[2], argv[1]); 
    int fd = open(argv[1], O_CREAT | O_TRUNC | O_WRONLY, 0644);
    if(fd == -1)
    {
        syslog(LOG_ERR, "Failed to open file: %m\n");
        closelog();
        exit(1);
    }
    if(write(fd, argv[2], strlen(argv[2])) == -1)
    {
        syslog(LOG_ERR, "Failed to write to the file: %m\n");
        close(fd);
        closelog();
        exit(1);
    }
    if(close(fd) == -1)
    {
        syslog(LOG_ERR, "Failed to close the file: %m\n");
        closelog();
        exit(1);
    }
    closelog();
    exit(0);
}
