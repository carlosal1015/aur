Time to testing!

#### `petsc-complex`

```console
$ docker run -it --rm ghcr.io/carlosal1015/aur/petsc-complex:latest
gitpod / $ sudo pacman --needed --noconfirm -Syu namcap
gitpod / $ namcap /tmp/petsc-complex-3.17.3-1-x86_64.pkg.tar.zst
petsc-complex E: ELF files outside of a valid path ('opt/').
petsc-complex W: ELF file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3') lacks FULL RELRO, check LDFLAGS.
petsc-complex W: Directory (opt/petsc/linux-c-opt/lib/petsc/bin/__pycache__) is empty
petsc-complex W: Referenced library 'sh' is an uninstalled dependency
petsc-complex W: Referenced library 'python3' is an uninstalled dependency
petsc-complex W: Referenced library 'python' is an uninstalled dependency
petsc-complex W: Referenced library 'csh' is an uninstalled dependency
petsc-complex W: Referenced library 'bash' is an uninstalled dependency
petsc-complex W: Unused shared library '/usr/lib/libmpi_usempif08.so.40' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libmpi_usempi_ignore_tkr.so.40' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libquadmath.so.0' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Dependency lapack included but already satisfied
gitpod / $ pacman -Ql petsc-complex
petsc-complex /opt/petsc/linux-c-opt/lib/libpetsc.so
petsc-complex /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17
petsc-complex /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3
petsc-complex /opt/petsc/linux-c-opt/lib/petsc4py/lib/PETSc.cpython-310-x86_64-linux-gnu.so
gitpod / $ ldd -v /opt/petsc/linux-c-opt/lib/libpetsc.so
        linux-vdso.so.1 (0x00007ffcc75c9000)
        liblapack.so.3 => /usr/lib/liblapack.so.3 (0x00007f5c23f5d000)
        libblas.so.3 => /usr/lib/libblas.so.3 (0x00007f5c23f06000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007f5c23e1f000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007f5c23be8000)
        libmpi_usempif08.so.40 => /usr/lib/libmpi_usempif08.so.40 (0x00007f5c23ba0000)
        libmpi_usempi_ignore_tkr.so.40 => /usr/lib/libmpi_usempi_ignore_tkr.so.40 (0x00007f5c23b90000)
        libmpi_mpifh.so.40 => /usr/lib/libmpi_mpifh.so.40 (0x00007f5c23b2a000)
        libmpi.so.40 => /usr/lib/libmpi.so.40 (0x00007f5c239ff000)
        libgfortran.so.5 => /usr/lib/libgfortran.so.5 (0x00007f5c23724000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007f5c23704000)
        libquadmath.so.0 => /usr/lib/libquadmath.so.0 (0x00007f5c236bb000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007f5c234af000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007f5c26a6e000)
        libopen-pal.so.40 => /usr/lib/libopen-pal.so.40 (0x00007f5c233fb000)
        libopen-rte.so.40 => /usr/lib/libopen-rte.so.40 (0x00007f5c23341000)
        libhwloc.so.15 => /usr/lib/libhwloc.so.15 (0x00007f5c232e4000)
        libevent_core-2.1.so.7 => /usr/lib/libevent_core-2.1.so.7 (0x00007f5c232ab000)
        libevent_pthreads-2.1.so.7 => /usr/lib/libevent_pthreads-2.1.so.7 (0x00007f5c232a6000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007f5c2328a000)
        libudev.so.1 => /usr/lib/libudev.so.1 (0x00007f5c2325c000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007f5c23257000)

        Version information:
        /opt/petsc/linux-c-opt/lib/libpetsc.so:
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_4.0.0) => /usr/lib/libgcc_s.so.1
                libgfortran.so.5 (GFORTRAN_10) => /usr/lib/libgfortran.so.5
                libgfortran.so.5 (GFORTRAN_8) => /usr/lib/libgfortran.so.5
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.23) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libstdc++.so.6 (GLIBCXX_3.4.29) => /usr/lib/libstdc++.so.6
                libstdc++.so.6 (GLIBCXX_3.4.30) => /usr/lib/libstdc++.so.6
                libstdc++.so.6 (CXXABI_1.3.9) => /usr/lib/libstdc++.so.6
                libstdc++.so.6 (GLIBCXX_3.4) => /usr/lib/libstdc++.so.6
                libstdc++.so.6 (CXXABI_1.3) => /usr/lib/libstdc++.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/liblapack.so.3:
                libgcc_s.so.1 (GCC_4.0.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libgfortran.so.5 (GFORTRAN_8) => /usr/lib/libgfortran.so.5
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.27) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
        /usr/lib/libblas.so.3:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libgfortran.so.5 (GFORTRAN_8) => /usr/lib/libgfortran.so.5
        /usr/lib/libm.so.6:
                ld-linux-x86-64.so.2 (GLIBC_PRIVATE) => /usr/lib64/ld-linux-x86-64.so.2
                libc.so.6 (GLIBC_2.35) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_PRIVATE) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libstdc++.so.6:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                libgcc_s.so.1 (GCC_4.2.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.4) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.25) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.18) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.16) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.32) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libmpi_usempif08.so.40:
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libmpi_mpifh.so.40:
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libmpi.so.40:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3.1) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libgfortran.so.5:
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                libquadmath.so.0 (QUADMATH_1.0) => /usr/lib/libquadmath.so.0
                libgcc_s.so.1 (GCC_4.2.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_4.3.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.15) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.25) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libm.so.6 (GLIBC_2.26) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.27) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.18) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
        /usr/lib/libgcc_s.so.1:
                libc.so.6 (GLIBC_2.35) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libquadmath.so.0:
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3.1) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.10) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libm.so.6 (GLIBC_2.23) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
        /usr/lib/libc.so.6:
                ld-linux-x86-64.so.2 (GLIBC_2.2.5) => /usr/lib64/ld-linux-x86-64.so.2
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                ld-linux-x86-64.so.2 (GLIBC_PRIVATE) => /usr/lib64/ld-linux-x86-64.so.2
        /usr/lib/libopen-pal.so.40:
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
        /usr/lib/libopen-rte.so.40:
                libz.so.1 (ZLIB_1.2.0) => /usr/lib/libz.so.1
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.15) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libhwloc.so.15:
                libudev.so.1 (LIBUDEV_183) => /usr/lib/libudev.so.1
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.32) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libevent_core-2.1.so.7:
                libpthread.so.0 (GLIBC_2.2.5) => /usr/lib/libpthread.so.0
                libc.so.6 (GLIBC_2.25) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.9) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.15) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.10) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libevent_pthreads-2.1.so.7:
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libpthread.so.0 (GLIBC_2.2.5) => /usr/lib/libpthread.so.0
                libpthread.so.0 (GLIBC_2.3.2) => /usr/lib/libpthread.so.0
        /usr/lib/libz.so.1:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
        /usr/lib/libudev.so.1:
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3.1) => /usr/lib/libgcc_s.so.1
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                libc.so.6 (GLIBC_2.9) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.25) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.28) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.16) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.30) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libpthread.so.0:
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
gitpod / $ ldd -v /opt/petsc/linux-c-opt/lib/petsc4py/lib/PETSc.cpython-310-x86_64-linux-gnu.so
        linux-vdso.so.1 (0x00007fff61eaa000)
        libpetsc.so.3.17 => /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17 (0x00007fbc023f0000)
        libmpi.so.40 => /usr/lib/libmpi.so.40 (0x00007fbc022c5000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007fbc020b9000)
        liblapack.so.3 => /usr/lib/liblapack.so.3 (0x00007fbc019f1000)
        libblas.so.3 => /usr/lib/libblas.so.3 (0x00007fbc0199a000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007fbc018b1000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007fbc0167a000)
        libmpi_usempif08.so.40 => /usr/lib/libmpi_usempif08.so.40 (0x00007fbc01632000)
        libmpi_usempi_ignore_tkr.so.40 => /usr/lib/libmpi_usempi_ignore_tkr.so.40 (0x00007fbc01622000)
        libmpi_mpifh.so.40 => /usr/lib/libmpi_mpifh.so.40 (0x00007fbc015be000)
        libgfortran.so.5 => /usr/lib/libgfortran.so.5 (0x00007fbc012e3000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007fbc012c1000)
        libquadmath.so.0 => /usr/lib/libquadmath.so.0 (0x00007fbc01278000)
        libopen-rte.so.40 => /usr/lib/libopen-rte.so.40 (0x00007fbc011b7000)
        libopen-pal.so.40 => /usr/lib/libopen-pal.so.40 (0x00007fbc0110c000)
        libhwloc.so.15 => /usr/lib/libhwloc.so.15 (0x00007fbc010af000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007fbc04ca4000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007fbc01093000)
        libevent_core-2.1.so.7 => /usr/lib/libevent_core-2.1.so.7 (0x00007fbc0105a000)
        libevent_pthreads-2.1.so.7 => /usr/lib/libevent_pthreads-2.1.so.7 (0x00007fbc01055000)
        libudev.so.1 => /usr/lib/libudev.so.1 (0x00007fbc01027000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007fbc01022000)

        Version information:
        /opt/petsc/linux-c-opt/lib/petsc4py/lib/PETSc.cpython-310-x86_64-linux-gnu.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17:
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_4.0.0) => /usr/lib/libgcc_s.so.1
                libgfortran.so.5 (GFORTRAN_10) => /usr/lib/libgfortran.so.5
                libgfortran.so.5 (GFORTRAN_8) => /usr/lib/libgfortran.so.5
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.23) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libstdc++.so.6 (GLIBCXX_3.4.29) => /usr/lib/libstdc++.so.6
                libstdc++.so.6 (GLIBCXX_3.4.30) => /usr/lib/libstdc++.so.6
                libstdc++.so.6 (CXXABI_1.3.9) => /usr/lib/libstdc++.so.6
                libstdc++.so.6 (GLIBCXX_3.4) => /usr/lib/libstdc++.so.6
                libstdc++.so.6 (CXXABI_1.3) => /usr/lib/libstdc++.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libmpi.so.40:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3.1) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libc.so.6:
                ld-linux-x86-64.so.2 (GLIBC_2.2.5) => /usr/lib64/ld-linux-x86-64.so.2
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                ld-linux-x86-64.so.2 (GLIBC_PRIVATE) => /usr/lib64/ld-linux-x86-64.so.2
        /usr/lib/liblapack.so.3:
                libgcc_s.so.1 (GCC_4.0.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libgfortran.so.5 (GFORTRAN_8) => /usr/lib/libgfortran.so.5
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.27) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
        /usr/lib/libblas.so.3:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libgfortran.so.5 (GFORTRAN_8) => /usr/lib/libgfortran.so.5
        /usr/lib/libm.so.6:
                ld-linux-x86-64.so.2 (GLIBC_PRIVATE) => /usr/lib64/ld-linux-x86-64.so.2
                libc.so.6 (GLIBC_2.35) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_PRIVATE) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libstdc++.so.6:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                libgcc_s.so.1 (GCC_4.2.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.4) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.25) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.18) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.16) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.32) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libmpi_usempif08.so.40:
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libmpi_mpifh.so.40:
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libgfortran.so.5:
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                libquadmath.so.0 (QUADMATH_1.0) => /usr/lib/libquadmath.so.0
                libgcc_s.so.1 (GCC_4.2.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_4.3.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.15) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.25) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libm.so.6 (GLIBC_2.26) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.27) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.18) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
        /usr/lib/libgcc_s.so.1:
                libc.so.6 (GLIBC_2.35) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libquadmath.so.0:
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3.1) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.10) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libm.so.6 (GLIBC_2.23) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
        /usr/lib/libopen-rte.so.40:
                libz.so.1 (ZLIB_1.2.0) => /usr/lib/libz.so.1
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.15) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libopen-pal.so.40:
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
        /usr/lib/libhwloc.so.15:
                libudev.so.1 (LIBUDEV_183) => /usr/lib/libudev.so.1
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.32) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libz.so.1:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
        /usr/lib/libevent_core-2.1.so.7:
                libpthread.so.0 (GLIBC_2.2.5) => /usr/lib/libpthread.so.0
                libc.so.6 (GLIBC_2.25) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.9) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.15) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.10) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libevent_pthreads-2.1.so.7:
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libpthread.so.0 (GLIBC_2.2.5) => /usr/lib/libpthread.so.0
                libpthread.so.0 (GLIBC_2.3.2) => /usr/lib/libpthread.so.0
        /usr/lib/libudev.so.1:
                libgcc_s.so.1 (GCC_3.0) => /usr/lib/libgcc_s.so.1
                libgcc_s.so.1 (GCC_3.3.1) => /usr/lib/libgcc_s.so.1
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                libc.so.6 (GLIBC_2.9) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.25) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.28) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.16) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.8) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.30) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libpthread.so.0:
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
gitpod / $ source /etc/profile.d/petsc.sh
```