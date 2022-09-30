load("//:my_custom_build_rule.bzl", "build_with_my_custom_rule")

build_with_my_custom_rule(
    name = "build_me",
    my_custom_string = "This is my custom String",
    my_custom_build_script = "//:main.py",
    my_external_compiler = "@downloaded-python//:python.exe"
    )