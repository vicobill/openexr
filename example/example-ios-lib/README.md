使用方式：
`-DPLATFORM`定义目标平台。取值见`ios.toolchain.cmake`

```
cmake -B build -G Xcode -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake -DPLATFORM=OS64
cmake --build build --config Release
```

如果PLATFORM是XXXCOMBINED，则是完整的FAT库，设备和模拟器都可使用，但只能通过-G Xcode 且在cmake 3.14+ 版本中有用。如：
```
cmake . -G XCode -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake -DPLATFORM=OS64COMBINED
cmake --build . --config Release
cmake --install . --config Release # 这一步是构建combined库必要的。
```

暴露的变量：
- XCODE_VERSION: 探测的XCode版本号
- SDK_VERSIOIN: 使用的SDK的版本
- CMAKE_OSX_ARCHITECTURES: 被编译的目标平台的架构
- APPLE_TARGET_TRIPLE: autoconf构建系统使用的变量。


额外的选项：
- -DENABLE_BITCODE=(BOOL): 默认禁用，设为TRUE或1，可启用bitcode
- ENABLE_ARC=(BOOL) 默认启用，设为FALSE或0禁用ARC
- ENABLE_VISIBILITY: 默认禁用，设为TRUE或1启用符号可见支持
- ENABLE_STRICT_TRY_COMPILE=(BOOL) 默认禁用。设为TRUE或1启用严格编译器检查（将会在所有编译器尽量执行linter）
- ARCHS=(STRING) 有效值为armv7, armv7s, arm64, i386, x86_64, armv7k, arm64_32.默认将会构建基于`-DPLATFORM`的所有有效架构。

> 为了将所有平台结合到相同FAT库，可使用"COMBINED"平台类型或使用LIPO工具。LIPO工具使用可参考网络上的一些文章。