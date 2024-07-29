from ortools.sat.python import cp_model
from ortools.sat.python.cp_model import CpSolverSolutionCallback


class MySolutionPrinter(CpSolverSolutionCallback):

    def __init__(self, variables):
        CpSolverSolutionCallback.__init__(self)
        self.__variables = variables
        self.__solution_count = 0

    def on_solution_callback(self):
        self.__solution_count += 1
        for v in self.__variables:
            print('%s=%i' % (v, self.Value(v)), end=' ')
            print()

    def solution_count(self):
        return self.__solution_count


def OptimUsine():
    model = cp_model.CpModel()
    x = model.NewIntVar(0, 15, 'x')
    y = model.NewIntVar(0, 10, 'y')
    model.Add(2 * x + y <= 20)
    model.Maximize(13200 * x + 8600 * y)
    solver = cp_model.CpSolver()
    solutionPrint:MySolutionPrinter = MySolutionPrinter([x, y])
    status = solver.Solve(model, solutionPrint)

OptimUsine()
