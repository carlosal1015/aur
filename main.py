from slepc4py import SLEPc
from petsc4py import PETSc

from mpi4py import MPI
import numpy as np
import ufl
import basix
from dolfinx.fem import (
    Function,
    functionspace,
    dirichletbc,
    form,
    locate_dofs_topological,
)
from basix.ufl import element
from dolfinx.mesh import CellType, create_rectangle, locate_entities_boundary
from ufl import inner, dx
from dolfinx.fem.petsc import assemble_matrix

mesh = create_rectangle(
    MPI.COMM_WORLD,
    [np.array([0.0, 0.0]), np.array([np.pi, np.pi])],
    [24, 24],
    CellType.triangle,
)

e = element("N1curl", basix.CellType.triangle, 1)
V = functionspace(mesh, e)

u = ufl.TrialFunction(V)
v = ufl.TestFunction(V)

a = inner(ufl.curl(u), ufl.curl(v)) * dx
b = inner(u, v) * dx

boundary_facets = locate_entities_boundary(
    mesh, mesh.topology.dim - 1, lambda x: np.full(x.shape[1], True, dtype=bool)
)
boundary_dofs = locate_dofs_topological(V, mesh.topology.dim - 1, boundary_facets)

zero_u = Function(V)
zero_u.x.array[:] = 0.0
bcs = [dirichletbc(zero_u, boundary_dofs)]

a, b = form(a), form(b)
A = assemble_matrix(a, bcs=bcs)
A.assemble()
B = assemble_matrix(b, bcs=bcs, diagonal=0.01)
B.assemble()

eps = SLEPc.EPS().create()
eps.setOperators(A, B)
PETSc.Options()["eps_type"] = "krylovschur"
PETSc.Options()["eps_gen_hermitian"] = ""
PETSc.Options()["eps_target_magnitude"] = ""
PETSc.Options()["eps_target"] = 5.0
PETSc.Options()["eps_view"] = ""
PETSc.Options()["eps_nev"] = 12
eps.setFromOptions()
eps.solve()

num_converged = eps.getConverged()
eigenvalues_unsorted = np.zeros(num_converged, dtype=np.complex128)

for i in range(0, num_converged):
    eigenvalues_unsorted[i] = eps.getEigenvalue(i)

assert np.isclose(np.imag(eigenvalues_unsorted), 0.0).all()
eigenvalues_sorted = np.sort(np.real(eigenvalues_unsorted))[:-1]
eigenvalues_sorted = eigenvalues_sorted[np.logical_not(eigenvalues_sorted < 1e-8)]

eigenvalues_exact = np.array([1.0, 1.0, 2.0, 4.0, 4.0, 5.0, 5.0, 8.0, 9.0])
assert np.isclose(
    eigenvalues_sorted[0 : eigenvalues_exact.shape[0]], eigenvalues_exact, rtol=1e-2
).all()

eps.destroy()
A.destroy()
B.destroy()
