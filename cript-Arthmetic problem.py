from itertools import permutations


def is_valid(puzzle, solution):
    send, more, money = puzzle
    s, e, n, d = solution[send[0]], solution[send[1]], solution[send[2]], solution[send[3]]
    m, o, r, y = solution[more[0]], solution[more[1]], solution[more[2]], solution[more[3]]
    mny = solution[money[0]], solution[money[1]], solution[money[2]], solution[money[3]], solution[money[4]]

    if s == 0 or m == 0:
        return False

    send_num = int(f"{s}{e}{n}{d}")
    more_num = int(f"{m}{o}{r}{e}")
    money_num = int(f"{mny[0]}{mny[1]}{mny[2]}{mny[3]}{mny[4]}")

    return send_num + more_num == money_num


def solve_cryptarithmetic(puzzle):
    letters = set("".join(puzzle))
    if len(letters) > 10:
        return "Invalid input: More than 10 unique letters."

    for perm in permutations(range(10), len(letters)):
        solution = dict(zip(letters, perm))
        if is_valid(puzzle, solution):
            return solution
    return "No solution found."


puzzle = ("SEND", "MORE", "MONEY")
solution = solve_cryptarithmetic(puzzle)
print("Cryptarithmetic Puzzle Solution:")
print(solution)
