from queue import PriorityQueue
def astar(graph, start, goal, heuristic):
    open_set = PriorityQueue()
    open_set.put((0, start))  
    came_from = {}
    g_score = {node: float("inf") for node in graph}
    g_score[start] = 0
    while not open_set.empty():
        current_node = open_set.get()[1]
        if current_node == goal:
            path = []
            while current_node in came_from:
                path.append(current_node)
                current_node = came_from[current_node]
            return path[::-1]
        for neighbor in graph[current_node]:
            tentative_g_score = g_score[current_node] + graph[current_node][neighbor]
            if tentative_g_score < g_score[neighbor]:
                came_from[neighbor] = current_node
                g_score[neighbor] = tentative_g_score
                f_score = tentative_g_score + heuristic[neighbor]
                open_set.put((f_score, neighbor))
    return None 
graph = {
    'A': {'B': 5, 'C': 8},
    'B': {'D': 9},
    'C': {'D': 6},
    'D': {}
}
heuristic = {'A': 10, 'B': 7, 'C': 5, 'D': 0}
start_node = 'A'
goal_node = 'D'
result = astar(graph, start_node, goal_node, heuristic)

if result:
    print(f"Shortest path from {start_node} to {goal_node}: {result}")
else:
    print("No path found.")
