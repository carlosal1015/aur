Time to testing!

#### `petsc + suitesparse`

```console
$ docker run -it --rm ghcr.io/carlosal1015/aur/petsc-suitesparse:latest
gitpod / $ sudo pacman --needed --noconfirm -Syu namcap
gitpod / $ namcap /tmp/petsc-3.17.2-1-x86_64.pkg.tar.zst
petsc E: ELF files outside of a valid path ('opt/').
petsc W: ELF file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2') lacks FULL RELRO, check LDFLAGS.
petsc W: Directory (opt/petsc/linux-c-opt/lib/petsc/bin/__pycache__) is empty
petsc W: Referenced library 'bash' is an uninstalled dependency
petsc W: Referenced library 'python3' is an uninstalled dependency
petsc W: Referenced library 'python' is an uninstalled dependency
petsc W: Referenced library 'csh' is an uninstalled dependency
petsc W: Referenced library 'sh' is an uninstalled dependency
petsc W: Unused shared library '/usr/lib/libbtf.so.1' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libccolamd.so.2' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libcolamd.so.2' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libcamd.so.2' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libsuitesparseconfig.so.5' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libmpi_usempif08.so.40' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libmpi_usempi_ignore_tkr.so.40' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libquadmath.so.0' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Dependency suitesparse detected but optional (libraries ['usr/lib/libccolamd.so.2', 'usr/lib/libsuitesparseconfig.so.5', 'usr/lib/libumfpack.so.5', 'usr/lib/libspqr.so.2', 'usr/lib/libklu.so.1', 'usr/lib/libamd.so.2', 'usr/lib/libbtf.so.1', 'usr/lib/libcholmod.so.3', 'usr/lib/libcolamd.so.2', 'usr/lib/libcamd.so.2'] needed in files ['opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2'])
petsc W: Dependency lapack included but already satisfied
gitpod / $ pacman -Ql petsc
petsc /opt/petsc/linux-c-opt/lib/libpetsc.so
petsc /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17
petsc /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2
petsc /opt/petsc/linux-c-opt/lib/petsc4py/lib/PETSc.cpython-310-x86_64-linux-gnu.so
gitpod / $ ldd -v /opt/petsc/linux-c-opt/lib/libpetsc.so
        linux-vdso.so.1 (0x00007ffe22cce000)
        libspqr.so.2 => /usr/lib/libspqr.so.2 (0x00007ff651f34000)
        libumfpack.so.5 => /usr/lib/libumfpack.so.5 (0x00007ff651e6f000)
        libklu.so.1 => /usr/lib/libklu.so.1 (0x00007ff651e3b000)
        libcholmod.so.3 => /usr/lib/libcholmod.so.3 (0x00007ff651d37000)
        libbtf.so.1 => /usr/lib/libbtf.so.1 (0x00007ff651d31000)
        libccolamd.so.2 => /usr/lib/libccolamd.so.2 (0x00007ff651d24000)
        libcolamd.so.2 => /usr/lib/libcolamd.so.2 (0x00007ff651d19000)
        libcamd.so.2 => /usr/lib/libcamd.so.2 (0x00007ff651d0b000)
        libamd.so.2 => /usr/lib/libamd.so.2 (0x00007ff651cff000)
        libsuitesparseconfig.so.5 => /usr/lib/libsuitesparseconfig.so.5 (0x00007ff651cfa000)
        liblapack.so.3 => /usr/lib/liblapack.so.3 (0x00007ff651632000)
        libblas.so.3 => /usr/lib/libblas.so.3 (0x00007ff6515db000)
        libmetis.so => /usr/lib/libmetis.so (0x00007ff651571000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007ff65148a000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007ff651253000)
        libmpi_usempif08.so.40 => /usr/lib/libmpi_usempif08.so.40 (0x00007ff65120b000)
        libmpi_usempi_ignore_tkr.so.40 => /usr/lib/libmpi_usempi_ignore_tkr.so.40 (0x00007ff6511fb000)
        libmpi_mpifh.so.40 => /usr/lib/libmpi_mpifh.so.40 (0x00007ff651197000)
        libmpi.so.40 => /usr/lib/libmpi.so.40 (0x00007ff65106a000)
        libgfortran.so.5 => /usr/lib/libgfortran.so.5 (0x00007ff650d8f000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007ff650d6f000)
        libquadmath.so.0 => /usr/lib/libquadmath.so.0 (0x00007ff650d26000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007ff650b1a000)
        libgomp.so.1 => /usr/lib/libgomp.so.1 (0x00007ff650ac9000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007ff653fc8000)
        libopen-pal.so.40 => /usr/lib/libopen-pal.so.40 (0x00007ff650a1c000)
        libopen-rte.so.40 => /usr/lib/libopen-rte.so.40 (0x00007ff650962000)
        libhwloc.so.15 => /usr/lib/libhwloc.so.15 (0x00007ff650905000)
        libevent_core-2.1.so.7 => /usr/lib/libevent_core-2.1.so.7 (0x00007ff6508cc000)
        libevent_pthreads-2.1.so.7 => /usr/lib/libevent_pthreads-2.1.so.7 (0x00007ff6508c7000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007ff6508ab000)
        libudev.so.1 => /usr/lib/libudev.so.1 (0x00007ff65087d000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007ff650878000)

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
        linux-vdso.so.1 (0x00007ffce2dc4000)
        libpetsc.so.3.17 => /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17 (0x00007fc81fe97000)
        libmpi.so.40 => /usr/lib/libmpi.so.40 (0x00007fc81fd6c000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007fc81fb60000)
        libspqr.so.2 => /usr/lib/libspqr.so.2 (0x00007fc81fb2d000)
        libumfpack.so.5 => /usr/lib/libumfpack.so.5 (0x00007fc81fa68000)
        libklu.so.1 => /usr/lib/libklu.so.1 (0x00007fc81fa32000)
        libcholmod.so.3 => /usr/lib/libcholmod.so.3 (0x00007fc81f92e000)
        libbtf.so.1 => /usr/lib/libbtf.so.1 (0x00007fc81f928000)
        libccolamd.so.2 => /usr/lib/libccolamd.so.2 (0x00007fc81f91b000)
        libcolamd.so.2 => /usr/lib/libcolamd.so.2 (0x00007fc81f912000)
        libcamd.so.2 => /usr/lib/libcamd.so.2 (0x00007fc81f904000)
        libamd.so.2 => /usr/lib/libamd.so.2 (0x00007fc81f8f6000)
        libsuitesparseconfig.so.5 => /usr/lib/libsuitesparseconfig.so.5 (0x00007fc81f8f1000)
        liblapack.so.3 => /usr/lib/liblapack.so.3 (0x00007fc81f229000)
        libblas.so.3 => /usr/lib/libblas.so.3 (0x00007fc81f1d2000)
        libmetis.so => /usr/lib/libmetis.so (0x00007fc81f16a000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007fc81f083000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007fc81ee4a000)
        libmpi_usempif08.so.40 => /usr/lib/libmpi_usempif08.so.40 (0x00007fc81ee02000)
        libmpi_usempi_ignore_tkr.so.40 => /usr/lib/libmpi_usempi_ignore_tkr.so.40 (0x00007fc81edf2000)
        libmpi_mpifh.so.40 => /usr/lib/libmpi_mpifh.so.40 (0x00007fc81ed8e000)
        libgfortran.so.5 => /usr/lib/libgfortran.so.5 (0x00007fc81eab3000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007fc81ea93000)
        libquadmath.so.0 => /usr/lib/libquadmath.so.0 (0x00007fc81ea48000)
        libopen-rte.so.40 => /usr/lib/libopen-rte.so.40 (0x00007fc81e986000)
        libopen-pal.so.40 => /usr/lib/libopen-pal.so.40 (0x00007fc81e8db000)
        libhwloc.so.15 => /usr/lib/libhwloc.so.15 (0x00007fc81e87e000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007fc822362000)
        libgomp.so.1 => /usr/lib/libgomp.so.1 (0x00007fc81e835000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007fc81e819000)
        libevent_core-2.1.so.7 => /usr/lib/libevent_core-2.1.so.7 (0x00007fc81e7e0000)
        libevent_pthreads-2.1.so.7 => /usr/lib/libevent_pthreads-2.1.so.7 (0x00007fc81e7db000)
        libudev.so.1 => /usr/lib/libudev.so.1 (0x00007fc81e7ad000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007fc81e7a8000)

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