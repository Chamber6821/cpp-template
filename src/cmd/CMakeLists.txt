project(cmd)

file(GLOB_RECURSE APPS "*.cpp")
foreach (APP_FILE ${APPS})
    get_filename_component(APP ${APP_FILE} NAME_WE)
    add_executable("${APP}" ${APP_FILE})
endforeach ()
