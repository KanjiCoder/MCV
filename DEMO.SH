    gcc_exe="M:\MCV_EXT\SOF\GCC\bin\gcc.exe"

    $gcc_exe -x c -c "DEMO.C11" -o "obj.obj"
    $gcc_exe -o "exe.exe" "obj.obj" -m64 -std=c11

    ./exe.exe
    bash_exit_status_variable=$?
    echo "[bash_exit_status_variable]:"
    echo  $bash_exit_status_variable

    rm "obj.obj"
    rm "exe.exe"

    read -p "[Press_Any_Key_To_Exit]"