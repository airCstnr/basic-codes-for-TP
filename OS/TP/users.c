#include <stdio.h>      // printf
#include <pwd.h>        // password
#include <grp.h>        // groups
#include <sys/types.h>  // gid_t

int main(int argc, char const *argv[]) {
    // real
    uid_t uid = getuid();
    gid_t gid = getgid();
    // effective
    uid_t euid = geteuid();
    gid_t egid = getegid();

    printf("User     : UID\t\tGID\n");
    printf("Réel     : %s(UID=%i),\t\t %s(GID=%i)\n",
        getpwuid(uid)->pw_name, uid,
        getgrgid(gid)->gr_name, gid);
    printf("Effectif : %s(UID=%i),\t\t %s(GID=%i)\n",
        getpwuid(euid)->pw_name, euid,
        getgrgid(egid)->gr_name, egid);
    return 0;
}
