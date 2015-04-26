#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const int MAXARGS=1024; 

/**
   Fonction construisant un tableau de chaines de caracteres, termine
   par NULL, à partir d'une seule chaine ou les mots sont separes par
   des espaces.
*/
static char **splitspace(char *cmd) {
  char *charcontext;
  char *cmdcopy;
  cmdcopy = malloc(strlen(cmd) + 1);
  if (cmdcopy == NULL)
    return NULL;
  strcpy(cmdcopy, cmd);
  char **args = malloc(sizeof(char*) * MAXARGS);
  memset(args, 0, sizeof(char*) * MAXARGS);
  
  char *res = strtok_r(cmdcopy, " ", &charcontext);
  args[0] = res;
  int i=0;
  while(res != NULL) {
    res = strtok_r(NULL, " ", &charcontext);
    ++i;
    args[i] = res;
  }
  args[i] = NULL;
  return args;
};

/**
   Fonction appellee par l'interpréteur perl pour executer une
   commande. Elle renvoie 0 si tout c'est bien passé et -1 sinon.

   !!! FONCTION A IMPLANTER !!!
*/
int executer(char *cmd) {
  printf("### Execution de la commande %s\n", cmd);

  char **args = splitspace(cmd);
  int i = 0;
  while(args[i] != 0) {
    printf("### Mot numéro %d: %s\n", i, args[i]);
    i++;
  }
  
  /* METTRE VOTRE CODE ICI */

  return 0;
}
