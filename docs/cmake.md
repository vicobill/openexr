# cmake 帮助文档

### get_directory_property
```
get_directory_property(<variable> [DIRECTORY <dir>] <prop-name>)

get_directory_property(<variable> [DIRECTORY <dir>] DEFINITION <var-name>)
```
- get_directory_property(variable [DIRECTORY <dir>] <prop-name>)
  从DIRECTORY域获取一个属性，保存为variable。DIRECTORY参数只是另外目录，以从其检索属性值，而不是当前目录。相对路径视作当前source目录的相对路径。CMake必须已经知道路径，或者通过add_subdirectory调用添加，或者是top level目录。在3.19中，<dir>可引用一个binary 目录。
  如果属性未在目录域中被提名，将会返回一个空的string。在INHERITED属性，如果属性在目录域中被找到，则会搜索define_property()命令描述的parent 域中搜索。
- 第二种中，从一个目录获取变量定义。此格式用于从另外目录中获取一个变量定义。

### get_property
```
get_property(<variable>
    <GLOBAL |
    DIRECTORY [<dir>] |
    TARGET  <target>    |
    SOURCE      <source> [DIRECTORY <dir> |
    TARGET_DIRECTORY <target>] |
    INSTALL     <file>
    TEST    <test> [DIRECTORY <dir>] |
    CACHE <entry> |
    VARIABLE
    >
    PROPERTY <name>
    [SET | DEFINED |BRIEF_DOCS | FULL_DOCS]
)
```
是更generic的获取属性的方式。
