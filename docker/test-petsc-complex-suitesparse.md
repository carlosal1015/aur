Time to testing!

#### `petsc-complex + suitesparse`

```console
$ docker run -it --rm ghcr.io/carlosal1015/aur/petsc-complex-suitesparse:latest
gitpod / $ sudo pacman --needed --noconfirm -Syu namcap
gitpod / $ namcap /tmp/petsc-complex-3.17.3-1-x86_64.pkg.tar.zst
petsc-complex E: ELF files outside of a valid path ('opt/').
petsc-complex W: ELF file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3') lacks FULL RELRO, check LDFLAGS.
petsc-complex W: Directory (opt/petsc/linux-c-opt/lib/petsc/bin/__pycache__) is empty
petsc-complex W: Referenced library 'csh' is an uninstalled dependency
petsc-complex W: Referenced library 'sh' is an uninstalled dependency
petsc-complex W: Referenced library 'python' is an uninstalled dependency
petsc-complex W: Referenced library 'bash' is an uninstalled dependency
petsc-complex W: Referenced library 'python3' is an uninstalled dependency
petsc-complex W: Unused shared library '/usr/lib/libbtf.so.1' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libccolamd.so.2' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libcolamd.so.2' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libcamd.so.2' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libsuitesparseconfig.so.5' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libmpi_usempif08.so.40' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libmpi_usempi_ignore_tkr.so.40' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Unused shared library '/usr/lib/libquadmath.so.0' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3')
petsc-complex W: Dependency suitesparse detected but optional (libraries ['usr/lib/libumfpack.so.5', 'usr/lib/libsuitesparseconfig.so.5', 'usr/lib/libspqr.so.2', 'usr/lib/libcolamd.so.2', 'usr/lib/libklu.so.1', 'usr/lib/libcamd.so.2', 'usr/lib/libbtf.so.1', 'usr/lib/libcholmod.so.3', 'usr/lib/libccolamd.so.2', 'usr/lib/libamd.so.2'] needed in files ['opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3'])
petsc-complex W: Dependency lapack included but already satisfied
gitpod / $ pacman -Ql petsc-complex
petsc-complex /opt/petsc/linux-c-opt/lib/libpetsc.so
petsc-complex /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17
petsc-complex /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.3
petsc-complex /opt/petsc/linux-c-opt/lib/petsc4py/lib/PETSc.cpython-310-x86_64-linux-gnu.so
gitpod / $ ldd -v /opt/petsc/linux-c-opt/lib/libpetsc.so
        linux-vdso.so.1 (0x00007ffdd0fd8000)
        libspqr.so.2 => /usr/lib/libspqr.so.2 (0x00007f1c7e9e3000)
        libumfpack.so.5 => /usr/lib/libumfpack.so.5 (0x00007f1c7e91e000)
        libklu.so.1 => /usr/lib/libklu.so.1 (0x00007f1c7e8ea000)
        libcholmod.so.3 => /usr/lib/libcholmod.so.3 (0x00007f1c7e7e6000)
        libbtf.so.1 => /usr/lib/libbtf.so.1 (0x00007f1c7e7e0000)
        libccolamd.so.2 => /usr/lib/libccolamd.so.2 (0x00007f1c7e7d3000)
        libcolamd.so.2 => /usr/lib/libcolamd.so.2 (0x00007f1c7e7c8000)
        libcamd.so.2 => /usr/lib/libcamd.so.2 (0x00007f1c7e7ba000)
        libamd.so.2 => /usr/lib/libamd.so.2 (0x00007f1c7e7ae000)
        libsuitesparseconfig.so.5 => /usr/lib/libsuitesparseconfig.so.5 (0x00007f1c7e7a9000)
        liblapack.so.3 => /usr/lib/liblapack.so.3 (0x00007f1c7e0e1000)
        libblas.so.3 => /usr/lib/libblas.so.3 (0x00007f1c7e08a000)
        libmetis.so => /usr/lib/libmetis.so (0x00007f1c7e020000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007f1c7df39000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007f1c7dd02000)
        libmpi_usempif08.so.40 => /usr/lib/libmpi_usempif08.so.40 (0x00007f1c7dcba000)
        libmpi_usempi_ignore_tkr.so.40 => /usr/lib/libmpi_usempi_ignore_tkr.so.40 (0x00007f1c7dcaa000)
        libmpi_mpifh.so.40 => /usr/lib/libmpi_mpifh.so.40 (0x00007f1c7dc46000)
        libmpi.so.40 => /usr/lib/libmpi.so.40 (0x00007f1c7db19000)
        libgfortran.so.5 => /usr/lib/libgfortran.so.5 (0x00007f1c7d83e000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007f1c7d81e000)
        libquadmath.so.0 => /usr/lib/libquadmath.so.0 (0x00007f1c7d7d5000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007f1c7d5c9000)
        libgomp.so.1 => /usr/lib/libgomp.so.1 (0x00007f1c7d578000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007f1c80e79000)
        libopen-pal.so.40 => /usr/lib/libopen-pal.so.40 (0x00007f1c7d4cb000)
        libopen-rte.so.40 => /usr/lib/libopen-rte.so.40 (0x00007f1c7d411000)
        libhwloc.so.15 => /usr/lib/libhwloc.so.15 (0x00007f1c7d3b4000)
        libevent_core-2.1.so.7 => /usr/lib/libevent_core-2.1.so.7 (0x00007f1c7d37b000)
        libevent_pthreads-2.1.so.7 => /usr/lib/libevent_pthreads-2.1.so.7 (0x00007f1c7d376000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007f1c7d35a000)
        libudev.so.1 => /usr/lib/libudev.so.1 (0x00007f1c7d32c000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007f1c7d327000)

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
        /usr/lib/libspqr.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libgcc_s.so.1 (GCC_4.0.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libumfpack.so.5:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libklu.so.1:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
        /usr/lib/libcholmod.so.3:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libgomp.so.1 (GOMP_4.0) => /usr/lib/libgomp.so.1
                libgomp.so.1 (OMP_1.0) => /usr/lib/libgomp.so.1
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libbtf.so.1:
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libccolamd.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
        /usr/lib/libcolamd.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
        /usr/lib/libcamd.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libamd.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libsuitesparseconfig.so.5:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
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
        /usr/lib/libmetis.so:
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                libm.so.6 (GLIBC_2.27) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.11) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
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
        /usr/lib/libgomp.so.1:
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.32) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
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
        linux-vdso.so.1 (0x00007fffe2bc8000)
        libpetsc.so.3.17 => /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17 (0x00007fef31598000)
        libmpi.so.40 => /usr/lib/libmpi.so.40 (0x00007fef3146d000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007fef31261000)
        libspqr.so.2 => /usr/lib/libspqr.so.2 (0x00007fef3122e000)
        libumfpack.so.5 => /usr/lib/libumfpack.so.5 (0x00007fef31169000)
        libklu.so.1 => /usr/lib/libklu.so.1 (0x00007fef31133000)
        libcholmod.so.3 => /usr/lib/libcholmod.so.3 (0x00007fef3102f000)
        libbtf.so.1 => /usr/lib/libbtf.so.1 (0x00007fef31029000)
        libccolamd.so.2 => /usr/lib/libccolamd.so.2 (0x00007fef3101c000)
        libcolamd.so.2 => /usr/lib/libcolamd.so.2 (0x00007fef31013000)
        libcamd.so.2 => /usr/lib/libcamd.so.2 (0x00007fef31005000)
        libamd.so.2 => /usr/lib/libamd.so.2 (0x00007fef30ff7000)
        libsuitesparseconfig.so.5 => /usr/lib/libsuitesparseconfig.so.5 (0x00007fef30ff2000)
        liblapack.so.3 => /usr/lib/liblapack.so.3 (0x00007fef3092a000)
        libblas.so.3 => /usr/lib/libblas.so.3 (0x00007fef308d3000)
        libmetis.so => /usr/lib/libmetis.so (0x00007fef3086b000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007fef30784000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007fef3054b000)
        libmpi_usempif08.so.40 => /usr/lib/libmpi_usempif08.so.40 (0x00007fef30503000)
        libmpi_usempi_ignore_tkr.so.40 => /usr/lib/libmpi_usempi_ignore_tkr.so.40 (0x00007fef304f3000)
        libmpi_mpifh.so.40 => /usr/lib/libmpi_mpifh.so.40 (0x00007fef3048f000)
        libgfortran.so.5 => /usr/lib/libgfortran.so.5 (0x00007fef301b4000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007fef30194000)
        libquadmath.so.0 => /usr/lib/libquadmath.so.0 (0x00007fef30149000)
        libopen-rte.so.40 => /usr/lib/libopen-rte.so.40 (0x00007fef30087000)
        libopen-pal.so.40 => /usr/lib/libopen-pal.so.40 (0x00007fef2ffdc000)
        libhwloc.so.15 => /usr/lib/libhwloc.so.15 (0x00007fef2ff7f000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007fef33e66000)
        libgomp.so.1 => /usr/lib/libgomp.so.1 (0x00007fef2ff36000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007fef2ff1a000)
        libevent_core-2.1.so.7 => /usr/lib/libevent_core-2.1.so.7 (0x00007fef2fee1000)
        libevent_pthreads-2.1.so.7 => /usr/lib/libevent_pthreads-2.1.so.7 (0x00007fef2fedc000)
        libudev.so.1 => /usr/lib/libudev.so.1 (0x00007fef2feae000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007fef2fea9000)

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
        /usr/lib/libspqr.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libgcc_s.so.1 (GCC_4.0.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libumfpack.so.5:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libklu.so.1:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
        /usr/lib/libcholmod.so.3:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libgomp.so.1 (GOMP_4.0) => /usr/lib/libgomp.so.1
                libgomp.so.1 (OMP_1.0) => /usr/lib/libgomp.so.1
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libbtf.so.1:
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libccolamd.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
        /usr/lib/libcolamd.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
        /usr/lib/libcamd.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libamd.so.2:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libsuitesparseconfig.so.5:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
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
        /usr/lib/libmetis.so:
                ld-linux-x86-64.so.2 (GLIBC_2.3) => /usr/lib64/ld-linux-x86-64.so.2
                libm.so.6 (GLIBC_2.27) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.11) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
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
        /usr/lib/libgomp.so.1:
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.32) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
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