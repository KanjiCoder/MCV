################################################################
## Executables We Will Be Using : --------------------------- ##

    gcc_exe="M:\MCV_EXT\SOF\GCC\bin\gcc.exe"
    ogl_exe="./glslangValidator.exe"

################################################################
## Compile Shaders: ----------------------------------------- ##

    $ogl_exe MCV.vert.glsl                                     \
        -S vert                                                \
        --target-env vulkan1.2                                 \
        -o mcv.vert.spv                                       ##

    $ogl_exe MCV.frag.glsl                                     \
        -S frag                                                \
        --target-env vulkan1.2                                 \
        -o mcv.frag.spv                                       ##

################################################################
## Original Project Compilation: ---------------------------- ##

    $gcc_exe -x c -c "DEMO.C11" -o "obj.obj"
    $gcc_exe -o "exe.exe" "obj.obj" -m64 -std=c11

    ./exe.exe
    bash_exit_status_variable=$?
    echo "[bash_exit_status_variable]:"
    echo  $bash_exit_status_variable

    rm "obj.obj"
    rm "exe.exe"

    read -p "[Press_Any_Key_To_Exit]"

################################################################