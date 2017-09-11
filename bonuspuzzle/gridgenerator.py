import random


class GridGenerator:
    def __init__(self, height, width):
        self.cells = []
        self.height = height
        self.width = width
        self.randomlist = []
        random.seed()
        for i in range(0,height):
            for j in range(0,width):
                self.cells.append(0)

        while sum(self.randomlist) < 500:
            if 500 - sum(self.randomlist) < 10:
                self.randomlist.append(500 - sum(self.randomlist))
            else:
                self.randomlist.append(random.randint(1,9))
        for i in range(0,height):
            for j in range(0,width):
                if len(self.randomlist) > 0:
                    self.cells[i * height + j] = self.randomlist.pop()
        random.shuffle(self.cells)

    def __str__(self):
        results = []
        for i in range(0, self.height):
            for j in range(0, self.width):
                if self.cells[i * self.height + j] != 0:
                    results.append("\\node at (" + str(i*10 + 5) + "mm, " +
                                   str(j*10 + 5) + "mm){" + str(self.cells[i * self.height + j]) + "};")
        return "\n".join(results)

if __name__ == "__main__":
    grid = GridGenerator(12,12)
    print(grid)
    print(grid.cells)
    print(sum(grid.cells))
    f = open("./gridgen.out", mode='w', encoding="utf-8")
    f.write(str(grid))
