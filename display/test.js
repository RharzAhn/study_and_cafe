var arr = Array.from({ length: 26 }, (v, i) => String.fromCharCode(i + 65));
var seat = [];
function bfs(array) {
    const dx = [1, -1, 0, 0];
    const dy = [0, 0, 1, -1];
    var maps = [];
    for (var i = 0; i < 10; i++) {
        var mapCol = [];
        for (var j = 0; j < 10; j++) {
            mapCol.push(0);
        }
        maps.push(mapCol);
    }
    for (var num of array) {
        const x = num[1];
        const y = num[0];
        maps[y][x] = 1;
    }

    var count = 1;

    for (var i = 0; i < 10; i++) {
        for (var j = 0; j < 10; j++) {
            if (maps[i][j] == 1) {
                var str = arr.pop(0);
                seat.push(`${str}${count}`);
                count += 1;
                var que = [[j, i]];

                while (que) {
                    const x = que.pop(0)[0];
                    const y = que.pop(0)[1];

                    for (var dir of 4) {
                        const next_x = x + dx[dir][0];
                        const next_y = y + dy[dir][1];

                        if (
                            next_x < 10 &&
                            next_x > 0 &&
                            next_y < 10 &&
                            next_y > 0
                        ) {
                            if (maps[next_y][next_x] == 1) {
                                seat.push(`${srt}${count}`);
                            }
                        }
                    }
                }
                count = 0;
            }
        }
    }
    console.log(maps);
}
