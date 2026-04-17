#define KG_NO_RUNTIME 1
#include "../NativeLibs/Sokol/kira_graphics_native.c"

int main(int argc, char **argv) {
    if (argc != 4) {
        fprintf(stderr, "usage: ksl_asset_probe <asset_dir> <shader_name> <vertex_layout>\n");
        return 2;
    }
    return (int)kira_graphics_inspect_ksl_asset(argv[1], argv[2], argv[3]);
}
