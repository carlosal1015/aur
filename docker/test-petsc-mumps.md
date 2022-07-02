Time to testing!

#### `petsc + numps`

```console
$ docker run -it --rm ghcr.io/carlosal1015/aur/petsc-mumps:latest
gitpod / $ sudo pacman --needed --noconfirm -Syu namcap
gitpod / $ namcap /tmp/petsc-3.17.2-1-x86_64.pkg.tar.zst
petsc E: ELF files outside of a valid path ('opt/').
petsc W: ELF file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2') lacks FULL RELRO, check LDFLAGS.
petsc W: Directory (opt/petsc/linux-c-opt/lib/petsc/bin/__pycache__) is empty
petsc W: Referenced library 'sh' is an uninstalled dependency
petsc W: Referenced library 'csh' is an uninstalled dependency
petsc W: Referenced library 'bash' is an uninstalled dependency
petsc W: Referenced library 'python3' is an uninstalled dependency
petsc W: Referenced library 'python' is an uninstalled dependency
petsc W: Unused shared library '/usr/lib/libcmumps.so' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libsmumps.so' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libzmumps.so' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libmumps_common.so' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libpord.so' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libesmumps.so' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libptscotcherr.so' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libscotcherr.so' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libbz2.so.1.0' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libmpi_usempif08.so.40' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libmpi_usempi_ignore_tkr.so.40' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Unused shared library '/usr/lib/libquadmath.so.0' by file ('opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2')
petsc W: Dependency mumps detected but optional (libraries ['usr/lib/libcmumps.so', 'usr/lib/libdmumps.so', 'usr/lib/libmumps_common.so', 'usr/lib/libpord.so', 'usr/lib/libzmumps.so', 'usr/lib/libsmumps.so'] needed in files ['opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2'])
petsc W: Dependency lapack included but already satisfied
gitpod / $ pacman -Ql petsc
petsc /opt/petsc/linux-c-opt/lib/libpetsc.so
petsc /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17
petsc /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17.2
petsc /opt/petsc/linux-c-opt/lib/petsc4py/lib/PETSc.cpython-310-x86_64-linux-gnu.so
gitpod / $ ldd -v /opt/petsc/linux-c-opt/lib/libpetsc.so
        linux-vdso.so.1 (0x00007fff425f2000)
        libcmumps.so => /usr/lib/libcmumps.so (0x00007f90fe620000)
        libdmumps.so => /usr/lib/libdmumps.so (0x00007f90fe3e1000)
        libsmumps.so => /usr/lib/libsmumps.so (0x00007f90fe1a2000)
        libzmumps.so => /usr/lib/libzmumps.so (0x00007f90fdf5a000)
        libmumps_common.so => /usr/lib/libmumps_common.so (0x00007f90fdef0000)
        libpord.so => /usr/lib/libpord.so (0x00007f90fded7000)
        libscalapack.so => /usr/lib/libscalapack.so (0x00007f90fd915000)
        liblapack.so.3 => /usr/lib/liblapack.so.3 (0x00007f90fd24d000)
        libblas.so.3 => /usr/lib/libblas.so.3 (0x00007f90fd1f6000)
        libesmumps.so => /usr/lib/libesmumps.so (0x00007f90fd1ee000)
        libptscotch.so => /usr/lib/libptscotch.so (0x00007f90fd1a2000)
        libptscotcherr.so => /usr/lib/libptscotcherr.so (0x00007f90fd19d000)
        libscotch.so => /usr/lib/libscotch.so (0x00007f90fd10a000)
        libscotcherr.so => /usr/lib/libscotcherr.so (0x00007f90fd105000)
        libbz2.so.1.0 => /usr/lib/libbz2.so.1.0 (0x00007f90fd0f2000)
        libmetis.so => /usr/lib/libmetis.so (0x00007f90fd08a000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007f90fcfa3000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007f90fcd6c000)
        libmpi_usempif08.so.40 => /usr/lib/libmpi_usempif08.so.40 (0x00007f90fcd22000)
        libmpi_usempi_ignore_tkr.so.40 => /usr/lib/libmpi_usempi_ignore_tkr.so.40 (0x00007f90fcd12000)
        libmpi_mpifh.so.40 => /usr/lib/libmpi_mpifh.so.40 (0x00007f90fccae000)
        libmpi.so.40 => /usr/lib/libmpi.so.40 (0x00007f90fcb83000)
        libgfortran.so.5 => /usr/lib/libgfortran.so.5 (0x00007f90fc8a8000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007f90fc888000)
        libquadmath.so.0 => /usr/lib/libquadmath.so.0 (0x00007f90fc83d000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007f90fc631000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007f90fc610000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007f910090b000)
        libopen-pal.so.40 => /usr/lib/libopen-pal.so.40 (0x00007f90fc565000)
        libopen-rte.so.40 => /usr/lib/libopen-rte.so.40 (0x00007f90fc4ab000)
        libhwloc.so.15 => /usr/lib/libhwloc.so.15 (0x00007f90fc44c000)
        libevent_core-2.1.so.7 => /usr/lib/libevent_core-2.1.so.7 (0x00007f90fc413000)
        libevent_pthreads-2.1.so.7 => /usr/lib/libevent_pthreads-2.1.so.7 (0x00007f90fc40e000)
        libudev.so.1 => /usr/lib/libudev.so.1 (0x00007f90fc3e0000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007f90fc3db000)

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
        /usr/lib/libcmumps.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libdmumps.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libsmumps.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libzmumps.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libmumps_common.so:
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libpord.so:
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libscalapack.so:
                libgcc_s.so.1 (GCC_4.0.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libgfortran.so.5 (GFORTRAN_8) => /usr/lib/libgfortran.so.5
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.27) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
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
        /usr/lib/libesmumps.so:
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libptscotch.so:
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libptscotcherr.so:
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
        /usr/lib/libscotch.so:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.32) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
        /usr/lib/libscotcherr.so:
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
        /usr/lib/libbz2.so.1.0:
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
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
        /usr/lib/libz.so.1:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
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
        linux-vdso.so.1 (0x00007ffe40d21000)
        libpetsc.so.3.17 => /opt/petsc/linux-c-opt/lib/libpetsc.so.3.17 (0x00007f0892dc1000)
        libmpi.so.40 => /usr/lib/libmpi.so.40 (0x00007f0892c96000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007f0892a8a000)
        libcmumps.so => /usr/lib/libcmumps.so (0x00007f0892843000)
        libdmumps.so => /usr/lib/libdmumps.so (0x00007f0892604000)
        libsmumps.so => /usr/lib/libsmumps.so (0x00007f08923c3000)
        libzmumps.so => /usr/lib/libzmumps.so (0x00007f089217b000)
        libmumps_common.so => /usr/lib/libmumps_common.so (0x00007f0892111000)
        libpord.so => /usr/lib/libpord.so (0x00007f08920f8000)
        libscalapack.so => /usr/lib/libscalapack.so (0x00007f0891b38000)
        liblapack.so.3 => /usr/lib/liblapack.so.3 (0x00007f0891470000)
        libblas.so.3 => /usr/lib/libblas.so.3 (0x00007f0891417000)
        libesmumps.so => /usr/lib/libesmumps.so (0x00007f089140f000)
        libptscotch.so => /usr/lib/libptscotch.so (0x00007f08913c3000)
        libptscotcherr.so => /usr/lib/libptscotcherr.so (0x00007f08913be000)
        libscotch.so => /usr/lib/libscotch.so (0x00007f089132d000)
        libscotcherr.so => /usr/lib/libscotcherr.so (0x00007f0891328000)
        libbz2.so.1.0 => /usr/lib/libbz2.so.1.0 (0x00007f0891313000)
        libmetis.so => /usr/lib/libmetis.so (0x00007f08912ab000)
        libm.so.6 => /usr/lib/libm.so.6 (0x00007f08911c4000)
        libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00007f0890f8d000)
        libmpi_usempif08.so.40 => /usr/lib/libmpi_usempif08.so.40 (0x00007f0890f45000)
        libmpi_usempi_ignore_tkr.so.40 => /usr/lib/libmpi_usempi_ignore_tkr.so.40 (0x00007f0890f35000)
        libmpi_mpifh.so.40 => /usr/lib/libmpi_mpifh.so.40 (0x00007f0890ecf000)
        libgfortran.so.5 => /usr/lib/libgfortran.so.5 (0x00007f0890bf4000)
        libgcc_s.so.1 => /usr/lib/libgcc_s.so.1 (0x00007f0890bd4000)
        libquadmath.so.0 => /usr/lib/libquadmath.so.0 (0x00007f0890b8b000)
        libopen-rte.so.40 => /usr/lib/libopen-rte.so.40 (0x00007f0890aca000)
        libopen-pal.so.40 => /usr/lib/libopen-pal.so.40 (0x00007f0890a1f000)
        libhwloc.so.15 => /usr/lib/libhwloc.so.15 (0x00007f08909c0000)
        /usr/lib64/ld-linux-x86-64.so.2 (0x00007f08952ce000)
        libz.so.1 => /usr/lib/libz.so.1 (0x00007f08909a6000)
        libevent_core-2.1.so.7 => /usr/lib/libevent_core-2.1.so.7 (0x00007f089096d000)
        libevent_pthreads-2.1.so.7 => /usr/lib/libevent_pthreads-2.1.so.7 (0x00007f0890968000)
        libudev.so.1 => /usr/lib/libudev.so.1 (0x00007f0890938000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007f0890933000)

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
        /usr/lib/libcmumps.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libdmumps.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libsmumps.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libzmumps.so:
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libmumps_common.so:
                libc.so.6 (GLIBC_2.33) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libpord.so:
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libscalapack.so:
                libgcc_s.so.1 (GCC_4.0.0) => /usr/lib/libgcc_s.so.1
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libgfortran.so.5 (GFORTRAN_8) => /usr/lib/libgfortran.so.5
                libm.so.6 (GLIBC_2.29) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.27) => /usr/lib/libm.so.6
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
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
        /usr/lib/libesmumps.so:
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libptscotch.so:
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
        /usr/lib/libptscotcherr.so:
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
        /usr/lib/libscotch.so:
                libm.so.6 (GLIBC_2.2.5) => /usr/lib/libm.so.6
                libc.so.6 (GLIBC_2.14) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.6) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.32) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.17) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.7) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.2) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.34) => /usr/lib/libc.so.6
        /usr/lib/libscotcherr.so:
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
        /usr/lib/libbz2.so.1.0:
                libc.so.6 (GLIBC_2.3) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.3.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.4) => /usr/lib/libc.so.6
                libc.so.6 (GLIBC_2.2.5) => /usr/lib/libc.so.6
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