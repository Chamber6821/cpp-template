if (NOT DEFINED FILES)
    message(FATAL_ERROR "Variable FILES undefined. Use flag -DFILES=<path> to touch")
endif ()

file(TOUCH ${FILES})
