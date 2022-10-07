/^(\t| ){1,}import.+from/ {
    split($0, splited_line, "'");
    module_path = splited_line[2];

    split(module_path, splited_module_path, "/");
    splited_module_path_length = length(splited_module_path);

    print(splited_module_path[splited_module_path_length]);
}
