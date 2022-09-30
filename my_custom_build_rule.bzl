def _build_with_custom_python_impl(ctx):
    output_file = ctx.actions.declare_file("my_output.txt")

    # python.exe main.py ...
    ctx.actions.run(
        outputs = [output_file],
        executable = ctx.executable.my_external_compiler,
        arguments = [ctx.file.my_custom_build_script.path, output_file.path, ctx.attr.my_custom_string]
    )

    return DefaultInfo(files = depset([output_file]))

build_with_my_custom_rule = rule(
    implementation = _build_with_custom_python_impl,
    attrs = {
    "my_custom_string" : attr.string(),
    "my_custom_build_script" : attr.label(allow_single_file=True),
    "my_external_compiler" : attr.label(
        executable = True,
        cfg ="exec",
        allow_files = True)
    },
    )