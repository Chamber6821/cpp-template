if (NOT DEFINED PATH)
    message(FATAL_ERROR "Variable PATH undefined. Use flag -DPATH=<path> to remove folder")
endif ()

if (EXISTS ${PATH})
    file(REMOVE_RECURSE ${PATH})
endif ()
