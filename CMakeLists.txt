cmake_minimum_required(VERSION 2.6)
if(COMMAND cmake_policy)
  cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

project(Ensischemeshell)
enable_testing()
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -std=gnu99")

#########
# Gestion des logins
#########
# Vous devez editer la ligne suivante pour y mettre votre login
#########
set(LOGINS login1)

if (LOGINS MATCHES "logi1")
  message(FATAL_ERROR "** ERREUR / ERROR **: Vous devez modifier CMakeLists.txt pour remplacer login1 par votre login / Substitute login1 with your own login in CMakeLists.txt")
endif()



#####
# Détection de la position des headers de perl
#####
find_package(PerlLibs REQUIRED)
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -D_GNU_SOURCE -I${PERL_INCLUDE_PATH}")


##
# Si vous utilisez d'autres fichiers .c, en plus de ceux listés,
# il faut les ajouter ici
##
add_library(ensishell SHARED src/executer.c src/ensishell_wrap.c)
add_custom_target(perlmod COMMAND cp ${CMAKE_SOURCE_DIR}/src/ensishell.pm .)
add_custom_target(symboliclink COMMAND ln -fs libensishell.so ensishell.so)
add_dependencies(ensishell perlmod symboliclink)

##
# Programme de test
##
add_test(Compilation perl ${CMAKE_SOURCE_DIR}/tests/lsl.pl)
add_test(Fork perl ${CMAKE_SOURCE_DIR}/tests/fork.pl)
add_test(Execvp perl ${CMAKE_SOURCE_DIR}/tests/execvp.pl)
add_test(Waitpid perl ${CMAKE_SOURCE_DIR}/tests/waitpid.pl)
add_test(Valgrind perl ${CMAKE_SOURCE_DIR}/tests/valgrind.pl)
add_test(Valgrind perl ${CMAKE_SOURCE_DIR}/tests/existepas.pl)
add_test(Valgrind perl ${CMAKE_SOURCE_DIR}/tests/sleep10.pl)
add_test(Valgrind perl ${CMAKE_SOURCE_DIR}/tests/pasledroit.pl)
add_custom_target(check perl ${CMAKE_SOURCE_DIR}/tests/lsl.pl)
