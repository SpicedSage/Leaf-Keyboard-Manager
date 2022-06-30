width = 330
btn_size = 75
btn_count = 4

def center(count, size, space):
    spacing = {
        "error": None,
        "width": None,
        "size": None,
        "count": None,
        "gap": None,
        "cords": []
    }

    spacing["width"] = space
    spacing["size"] = size
    spacing["count"] = count

    gap_count = count + 1
    t_space = space

    free = t_space - (count * size)
    gap = free / gap_count

    spacing["gap"] = gap

    if gap < 0: 
        spacing["error"] = "Not enough space"

    for item in range(0, count):
        # print(item)
        location = (item * size) + ((item + 1) * gap)
        spacing["cords"].append(location)
    
    return spacing

result = center(btn_count, btn_size, width)

print(f'ERROR: {result["error"]}')
print(f'Count: {result["count"]}')
print(f'Gap: {result["gap"]}')
print(f'Cords: {result["cords"]}')
