if (NOT DEFINED FILES)
    message(FATAL_ERROR "Variable FILES undefined. Use flag -DFILES=\"<file1> <file2> <file3>\" to update list")
endif ()

if (NOT DEFINED OUT)
    message(FATAL_ERROR "Variable OUT undefined. Use flag -DOUT=<path> to save list")
endif ()

if (EXISTS ${OUT})
    file(READ ${OUT} OLD_FILES)
else ()
    set(OLD_FILES "")
endif ()

if (NOT "${OLD_FILES}" STREQUAL "${FILES}")
    file(WRITE ${OUT} "${FILES}")
endif ()
