import random

class GridGenerator:
    def __init__(self, *, density1=0.1, density2=0.05, density3=0.025, density4=0.0125):
        self.cells = []
        random.seed()
        for i in range(0, 15):
            self.cells.append([])
            for j in range(0, 20):
                prob = random.random()
                if prob <= density4:
                    self.cells[i].append(4)
                elif prob <= density3:
                    self.cells[i].append(3)
                elif prob <= density2:
                    self.cells[i].append(2)
                elif prob <= density1:
                    self.cells[i].append(1)
                else:
                    self.cells[i].append(0)

    def __str__(self):
        results = []
        for i in range(0, 15):
            for j in range(0, 20):
                if self.cells[i][j] != 0:
                    results.append("\\node at (" + str(i*10 + 5) + "mm, " +
                                   str(j*10 + 5) + "mm){" + str(self.cells[i][j]) + "};")
        return "\n".join(results)

if __name__ == "__main__":
    grid = GridGenerator()
    print(grid)
    f = open("gridgen.out", mode='w', encoding="utf-8")
    f.write(str(grid))
