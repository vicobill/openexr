
set_target_properties(OpenEXRCore OpenEXR OpenEXRUtil IlmThread Iex OpenEXRExamples
PROPERTIES  FOLDER OpenEXR)
set_target_properties(zlib zlibstatic
PROPERTIES FOLDER zlib)
set_target_properties(exr2aces exrcheck exrenvmap exrheader exrinfo exrmakepreview exrmaketiled exrmanifest exrmultipart exrmultiview exrstdattr
deepidexample deepidselect
PROPERTIES FOLDER OpenEXR/exes)
set_target_properties(webp webp_quality webpdecode webpdecoder 
webpdemux webpdsp webpdspdecode webpencode webpinfo webpmux 
webputils webputilsdecode extras get_disto imagedec imageenc 
imageioutil libwebpmux sharpyuv
PROPERTIES FOLDER webp)
set_target_properties(cwebp dwebp exampleutil img2webp
PROPERTIES FOLDER webp/examples)
set_target_properties(tiff tiff_faxtable tiff_mkg3states tiff_port
tiff_release tiff-bi tiffcp tiffdump tiff-grayscale tiffinfo 
tiff-palette tiff-rgb tiffset tiffsplit tiffxx addtiffo ascii_tag 
iptcutil
PROPERTIES FOLDER tiff)
set_target_properties(custom_dir custom_dir_EXIF_231 defer_strile_loading
 defer_strile_writing long_tag rewrite short_tag strip_rw 
 test_append_to_strip test_directory test_ifd_loop_detection 
 test_open_options test_signed_tags testtypes
  PROPERTIES FOLDER tiff/tests
)
set_target_properties(pcre2-8 pcre2grep pcre2-posix pcre2test 
PROPERTIES FOLDER pcre2)
set_target_properties(png_genfiles png_shared png_static pngfix png-fix-itxt pngimage pngstest pngtest pngunknown pngvalid
PROPERTIES FOLDER png)
set_target_properties(algo de265 dec265 encoder x86 x86_sse
PROPERTIES FOLDER libde265)
set_target_properties(brotli  brotlicommon brotlidec brotlienc
PROPERTIES FOLDER brotli)
set_target_properties(Imath 
PROPERTIES FOLDER Imath)
set_target_properties(imgcmp imginfo jasper multithread
PROPERTIES FOLDER jasper)
set_target_properties(test_1 tmrdemo
PROPERTIES FOLDER jasper/tests)
set_target_properties(libdeflate_prog_utils libdeflate_shared libdeflate_static libdeflate-gzip libjasper
PROPERTIES FOLDER libdeflate)
set_target_properties(openjp2 opj_compress opj_decompress opj_dump
PROPERTIES FOLDER openjp2)
set_property(TARGET jasper PROPERTY C_STANDARD 11)
