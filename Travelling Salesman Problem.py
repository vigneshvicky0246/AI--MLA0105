import itertools

def calculate_total_distance(order, distances):
    total_distance = 0
    for i in range(len(order) - 1):
        total_distance += distances[order[i]][order[i + 1]]
    total_distance += distances[order[-1]][order[0]]
    return total_distance

def tsp_bruteforce(distances):
    num_cities = len(distances)
    cities = list(range(num_cities))
    shortest_tour = None
    shortest_distance = float('inf')

    for order in itertools.permutations(cities):
        total_distance = calculate_total_distance(order, distances)
        if total_distance < shortest_distance:
            shortest_distance = total_distance
            shortest_tour = order

    return shortest_tour, shortest_distance

if __name__ == "__main__":
    distances = [
        [0, 1, 2, 3],
        [1, 0, 6, 4],
        [2, 6, 0, 5],
        [3, 4, 5, 0]
    ]

    shortest_tour, shortest_distance = tsp_bruteforce(distances)
    print("Shortest Tour:", shortest_tour)
    print("Shortest Distance:", shortest_distance)
