class MapColoringCSP:
    def __init__(self, variables, domains, neighbors):
        self.variables = variables
        self.domains = domains
        self.neighbors = neighbors

    def is_valid_assignment(self, assignment, var, color):
        for neighbor in self.neighbors[var]:
            if neighbor in assignment and assignment[neighbor] == color:
                return False
        return True

    def backtracking_search(self, assignment):
        if len(assignment) == len(self.variables):
            return assignment

        var = self.select_unassigned_variable(assignment)
        for color in self.order_domain_values(var, assignment):
            if self.is_valid_assignment(assignment, var, color):
                assignment[var] = color
                result = self.backtracking_search(assignment)
                if result is not None:
                    return result
                del assignment[var]
        return None

    def select_unassigned_variable(self, assignment):
        for var in self.variables:
            if var not in assignment:
                return var

    def order_domain_values(self, var, assignment):
        return self.domains[var]

def main():
    variables = ["WA", "NT", "SA", "Q", "NSW", "V", "T"]
    domains = {var: ["R", "G", "B"] for var in variables}
    neighbors = {
        "WA": ["NT", "SA"],
        "NT": ["WA", "SA", "Q"],
        "SA": ["WA", "NT", "Q", "NSW", "V"],
        "Q": ["NT", "SA", "NSW"],
        "NSW": ["Q", "SA", "V"],
        "V": ["SA", "NSW"],
        "T": []
    }

    csp = MapColoringCSP(variables, domains, neighbors)
    assignment = csp.backtracking_search({})
    
    if assignment is not None:
        print("Solution found:")
        for var, color in assignment.items():
            print(f"{var}: {color}")
    else:
        print("No solution found!")

if __name__ == "__main__":
    main()
